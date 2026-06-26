//
//  ReposRemoteDataSourceImpl.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Combine

final class ReposRemoteDataSourceImpl: ReposRemoteDataSource {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    func fetchRepositories(_ page: Int) -> AnyPublisher<[RepositoryDTO], NetworkError> {
        let endpoint = RepositoryEndpoint.trendingRepositories(page: page)
        
        return apiClient
            .request(for: endpoint)
            .map {
                (response: ReposResponseDTO) in
                response.items
            }
            .eraseToAnyPublisher()
    }
    
}
