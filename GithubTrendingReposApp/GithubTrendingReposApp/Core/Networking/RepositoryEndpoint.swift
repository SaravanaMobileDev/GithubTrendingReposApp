//
//  RepositoryEndpoint.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation


/// Endpoint Impl class for repository
enum RepositoryEndpoint: Endpoint {
    case trendingRepositories(page: Int)
    
    var path: String {
        "/search/repositories"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var host: String {
        "api.github.com"
    }
    
    var scheme: String {
        "https"
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .trendingRepositories(let page):
            return [
                .init(name: "q", value: "stars>1"),
                .init(name: "sort", value: "stars"),
                .init(name: "page", value: "\(page)"),
                .init(name: "per_page", value: "20")
            ]
        }
    }
    
    var url: URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path
        urlComponent.queryItems = queryItems
        
        return urlComponent.url
    }
    
    
}
