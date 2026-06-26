//
//  RepositoryMapper.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import Foundation

/// Mapper infrastructure to get repository from DTO
final class RepositoryMapper {
    func map(
        dto: RepositoryDTO
    ) -> Repository {
        Repository(
            id: dto.id,
            name: dto.name,
            description: dto.description,
            stars: dto.stargazers_count,
            avatarURL: URL(string: dto.owner.avatarURL)
        )
    }
}
