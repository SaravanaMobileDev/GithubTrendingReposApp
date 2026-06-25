//
//  Endpoint.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var host: String { get }
    var scheme: String { get }
    var queryItems: [URLQueryItem] { get }
    var url: URL? { get }
}
