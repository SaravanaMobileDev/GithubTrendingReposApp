//
//  ReposLocalDataSource.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

protocol ReposLocalDataSource {
    func save(_ repos: [RepositoryDTO])
    
    func fetch() -> [RepositoryDTO]
}
