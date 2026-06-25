//
//  ReposRemoteDataSource.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Combine

protocol ReposRemoteDataSource {
    func fetchRepositories(
        _ page: Int
    ) -> AnyPublisher<
        ReposResponseDTO,
        Error
    >
}
