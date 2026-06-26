//
//  RepositoryFooterView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct RepositoryFooterView: View {
    let stars: Int
    var body: some View {
        HStack(spacing: 16) {
            Label("\(stars)", systemImage: "star.fill")
            Spacer()
        }
        .font(.caption)
        .foregroundStyle(.secondary)
        
    }
}

#Preview {
    RepositoryFooterView(stars: 4)
}
