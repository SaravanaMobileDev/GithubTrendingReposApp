//
//  FetchReposUseCase.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Combine

/// This is the UseCase for domain layer definitaion which acts as the layer to fetch the data from the repository
///
/// Design Pattern
/// - UseCase Patter
/// Parameter: -  Page number
protocol FetchReposUseCase {
    func execute(
        _ page: Int
    ) -> AnyPublisher<
        [Repository],
        DomainError
    >
}




/// Default implementation of Fetch Repos Use case
///
/// In future we can add Sorting, filtering, analytics
final class FetchReposUseCaseImplementation: FetchReposUseCase {
    private let repos: ReposRepositoryProtocol
    
    init(
        _ repos: ReposRepositoryProtocol
    ) {
        self.repos = repos
    }
    
    func execute(_ page: Int) -> AnyPublisher<
        [Repository],
        DomainError
    > {
        repos.fetchRepository(page)
    }
}
