//
//  ReposLocalDataSourceImpl.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation


/// Implementation class for the localdata source with cache mechanism to store the data into userdefaults
///  and retrive it back as RepoDTO instead of storing large amount of repos it just the data that we are saving
final class ReposLocalDataSourceImpl: ReposLocalDataSource {
    private let cachedKey = "cached_repos_key"
    
    func save(_ repos: [RepositoryDTO]) {
        guard let data = try? JSONEncoder().encode(
            repos
        ) else {
            return
        }
        
        UserDefaults.standard.set(
            data,
            forKey: cachedKey
        )
    }
    
    func fetch() -> [RepositoryDTO] {
        guard let data = UserDefaults.standard.data(forKey: cachedKey),
              let repos = try? JSONDecoder().decode(
                [RepositoryDTO].self,
                from: data
              ) else {
            return []
        }
        
        return repos
    }
    
    
    
}
