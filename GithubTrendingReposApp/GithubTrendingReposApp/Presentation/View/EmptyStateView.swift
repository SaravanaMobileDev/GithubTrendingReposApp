//
//  EmptyStateView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Repositories", systemImage: "tray")
        } description: {
            Text("Try changing your search or pull to refresh to load repositories")
        }
    }
}

#Preview {
    EmptyStateView()
}
