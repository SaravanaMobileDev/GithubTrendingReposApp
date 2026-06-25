//
//  ReposResponseDTO.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

/// DTO - Data Transfer Object
///
/// Model for repos Response  returns from  API
///
/// It should be directly used in View, view model instead domainlayer repos will be used
/// This is only for API reponse
struct ReposResponseDTO: Codable {
    let items: [RepositoryDTO]
}
