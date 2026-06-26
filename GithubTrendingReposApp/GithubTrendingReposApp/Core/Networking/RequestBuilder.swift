//
//  RequestBuilder.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation


/// This is the builder pattern to build the request for the API call
enum RequestBuilder {
    static func build(for endpoint: Endpoint) throws -> URLRequest {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        
        return request
    }
}
