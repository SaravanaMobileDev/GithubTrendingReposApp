//
//  RepositoryRowView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct RepositoryRowView: View {
    let repo: Repository
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AvatarView(url: repo.avatarURL)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(repo.name)
                    .font(.headline)
                
                Text(repo.description ?? "")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                RepositoryFooterView(stars: repo.stars)
            }
        }
        .containerShape(Rectangle())
        .padding(.vertical, 8)
    }
}

#Preview {
//    RepositoryRowView()
}
