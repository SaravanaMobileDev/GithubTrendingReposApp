//
//  SearchRepositoriesUseCase.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

/// This is the usecase definition of search functionality
protocol SearchRepositoriesUseCase {
    func execute(
        _ query: String,
        _ repositories: [Repository]
    ) -> [Repository]
}


/// This is the actual implmentation of the search repos Use case
///
/// Passsing query as the paramenter from the presenation layer to filter out the repos already listed
final class SearchRepositoriesUseCaseImplemetation: SearchRepositoriesUseCase {
    func execute(
        _ query: String,
        _ repositories: [Repository]
    ) -> [Repository] {
        guard !query.isEmpty else {
            return repositories
        }
        
        return repositories
            .filter {
                $0.name.localizedStandardContains(
                    query
                )
            }
    }
}
