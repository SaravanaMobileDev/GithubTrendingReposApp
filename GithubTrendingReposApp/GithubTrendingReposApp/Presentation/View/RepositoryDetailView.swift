//
//  RepositoryDetailView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct RepositoryDetailView: View {
    let repo: Repository
    
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 24) {
                headerView
                
                descriptionView
                
                Divider()
                
                repositoryInfoView
            }
            .padding()
        }
        .navigationTitle("Repo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension RepositoryDetailView {
    var headerView: some View {
        VStack(spacing: 16) {
            AvatarView(url: repo.avatarURL)
                .frame(width: 100, height: 100)
            
            Text(repo.name)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: .infinity)
    }
}

private extension RepositoryDetailView {
    var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(.headline)
            
            Text(repo.description ?? "")
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}

private extension RepositoryDetailView {
    var repositoryInfoView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label {
                Text("\(repo.stars) Stars")
            } icon: {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .font(.body)
    }
}

#Preview {
//    RepositoryDetailView()
}
