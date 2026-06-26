//
//  LoadingView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
            
            Text("Loading Repositories...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
