//
//  Repository.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

/// This is model for Repository for domain layer
///
/// This is created with the internsion that it should be indepedent from
///  API Response Model
///  UI Models
///

struct Repository: Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stars: Int
    let avatarURL: URL?
}
