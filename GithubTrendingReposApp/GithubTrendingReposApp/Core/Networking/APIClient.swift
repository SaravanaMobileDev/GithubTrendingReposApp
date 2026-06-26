//
//  APIClient.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Combine


protocol APIClient {
    func request<T: Decodable>(for endpoint: Endpoint) -> AnyPublisher<T, NetworkError>
}
