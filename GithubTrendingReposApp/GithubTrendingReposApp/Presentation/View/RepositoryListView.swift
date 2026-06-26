//
//  RepositoryListView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject var viewModel: RepositoryListViewModel
    
    init(viewModel: RepositoryListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            content
            .navigationTitle("Trending")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $viewModel.searchText)
            .refreshable {
                viewModel.refresh()
            }
            .task {
                viewModel.loadRepositories()
            }
            .navigationDestination(for: Repository.self, destination: { repo in
                RepositoryDetailView(repo: repo)
            })
            .safeAreaInset(edge: .bottom) {
                if let error = viewModel.errorMessage {
                    EmptyBannerView(message: error)
                        .padding(.horizontal)
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

private extension RepositoryListView {
    @ViewBuilder
    var content: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if viewModel.repositories.isEmpty {
            EmptyStateView()
        } else {
            repositoryList
        }
    }
}

private extension RepositoryListView {
    var repositoryList: some View {
        List {
            repositorySection
            
            loadingSection
        }
        .listStyle(.plain)
        .animation(.default, value: viewModel.repositories)
    }
}

private extension RepositoryListView {
    var repositorySection: some View {
        Section {
            ForEach(viewModel.repositories) { repo in
                NavigationLink(value: repo) {
                    RepositoryRowView(repo: repo)
                }
                .onAppear {
                    viewModel.loadMoreIfNeeded(currentItem: repo)
                }
            }
        }
    }
}

private extension RepositoryListView {
    @ViewBuilder
    var loadingSection: some View {
        if viewModel.isLoadingMore {
            Section {
                LoadingMoreView()
            }
        }
    }
}

#Preview {
//    RepositoryListView()
}
