//
//  RepositoryListViewModel.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation
import Combine

@MainActor
final class RepositoryListViewModel: ObservableObject {
    //MARK: - Published
    @Published var repositories: [Repository] = []
    
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var isRefreshing = false
    @Published var isLoadingMore = false
    @Published var errorMessage: String?
    
    //MARK: - Dependencies
    private let fetchReposUseCase: FetchReposUseCase
    
    private let searchRepoUseCase: SearchRepositoriesUseCase
    
    //MARK: - Private properties
    
    private var allRepoitories: [Repository] = []
    private var cancellables = Set<AnyCancellable>()
    private var currentPage = 1
    private var hasMorePages = true
    
    //MARK: - Initializer
    init(_ fetchReposUseCase: FetchReposUseCase, _ searchRepoUseCase: SearchRepositoriesUseCase) {
        self.fetchReposUseCase = fetchReposUseCase
        self.searchRepoUseCase = searchRepoUseCase
        
        bindSearch()
    }
    
}

//MARK: Load Repositories from API
extension RepositoryListViewModel {
    func loadRepositories() {
        guard !isLoading else {
            return
        }
        
        isLoading = true
        
        fetchReposUseCase
            .execute(1)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                
                self.isLoading = false
                
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] repos in
                guard let self else { return }
                
                self.allRepoitories = repos
                self.repositories = repos
                
                self.currentPage = 1
            }
            .store(in: &cancellables)
    }
}

//MARK: - Search Debounce functionality
extension RepositoryListViewModel {
    func bindSearch() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self else { return }
                
                repositories = searchRepoUseCase.execute(query, allRepoitories)
            }
            .store(in: &cancellables)
    }
}

//MARK: - Refresh
extension RepositoryListViewModel {
    func refresh() {
        isRefreshing = true
        
        fetchReposUseCase
            .execute(1)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                
                self.isRefreshing = false
            } receiveValue: { [weak self] repos in
                guard let self else { return }
                
                self.allRepoitories = repos
                self.repositories = repos
                
                self.currentPage = 1
            }
            .store(in: &cancellables)
    }
}

//MARK: - LoadMore/InfinteScroll

extension RepositoryListViewModel {
    func loadMoreIfNeeded(currentItem: Repository) {
        guard let last = repositories.last,
              last.id == currentItem.id,
              !isLoadingMore,
              hasMorePages
                
        else { return }
        
        loadMore()
    }
}

private extension RepositoryListViewModel {
    func loadMore() {
        isLoadingMore = true
        
        let nextPage = currentPage + 1
        
        fetchReposUseCase
            .execute(nextPage)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                
                self.isLoadingMore = false
                
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] repos in
                guard let self else { return }
                
                if repos.isEmpty {
                    self.hasMorePages = false
                    return
                }
                
                self.allRepoitories.append(contentsOf: repos)
                
                self.repositories = self.allRepoitories
                
                currentPage = nextPage
            }
            .store(in: &cancellables)
    }
}
