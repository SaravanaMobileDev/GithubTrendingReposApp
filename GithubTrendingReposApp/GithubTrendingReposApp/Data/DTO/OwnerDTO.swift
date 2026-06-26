//
//  OwnerDTO.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

/// DTO - Data Transfer Object
///
/// Model for nested owner to get the avatar url to show it in the card view
///
/// It should be directly used in View, view model instead domainlayer repos will be used
/// This is only for API reponse
struct OwnerDTO: Codable {
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
