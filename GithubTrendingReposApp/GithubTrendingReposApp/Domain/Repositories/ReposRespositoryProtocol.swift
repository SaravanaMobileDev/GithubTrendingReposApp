//
//  ReposRespositoryProtocol.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Combine


/// This is the Repository protocol
///
/// Domain depends on abstraction rather than the implmentation
///
/// Repository Patter
protocol ReposRepositoryProtocol {
    func fetchRepository(
        _ page: Int
    ) -> AnyPublisher<
        [Repository],
        DomainError
    >
}
