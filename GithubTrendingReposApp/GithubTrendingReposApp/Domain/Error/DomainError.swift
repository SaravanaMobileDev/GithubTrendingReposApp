//
//  DomainError.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

/// Domain level bussiness errors
///
/// Domain layer should not expose the data layer errors like:
/// URLSession Errors
/// Decoding Errors
/// Database Errors
///

enum DomainError: Error {
    case noData
    case networkUnavailable
    case unknown
    case custom(String)
}
