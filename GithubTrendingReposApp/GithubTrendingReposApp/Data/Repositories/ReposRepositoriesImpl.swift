//
//  ReposRepositoriesImpl.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Combine

final class ReposRepositoriesImpl: ReposRepositoryProtocol {
    private let remoteDataSource: ReposRemoteDataSource
    private let localDataSource: ReposLocalDataSource
    
    init(_ remoteDataSource: ReposRemoteDataSource, _ localDataSource: ReposLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchRepository(_ page: Int) -> AnyPublisher<[Repository], DomainError> {
        remoteDataSource
            .fetchRepositories(page)
            .handleEvents(
                receiveOutput:  { [weak self] response in
                self?.localDataSource.save(response.items)
            })
            .map { response in
                response.items.map {
                    RepositoryMapper().map(dto: $0)
                }
            }
            .mapError { [weak self] _ in
                let cached = self?.localDataSource.fetch() ?? []
                if !cached.isEmpty {
                    return .custom("Showing Cached data")
                }
                return .networkUnavailable
            }
            .eraseToAnyPublisher()
    }
    
    
}
