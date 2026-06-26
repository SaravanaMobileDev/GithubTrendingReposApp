//
//  LoadingMoreView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct LoadingMoreView: View {
    var body: some View {
        HStack(spacing: 12) {
            Spacer()
            
            ProgressView()
            Text("Loading more...")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    LoadingMoreView()
}
