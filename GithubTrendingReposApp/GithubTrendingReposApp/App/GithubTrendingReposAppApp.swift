//
//  GithubTrendingReposAppApp.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

@main
struct GithubTrendingReposAppApp: App {
    private let container = AppContainer()
    var body: some Scene {
        WindowGroup {
            RepositoryListView(viewModel: container.repoViewModel)
        }
    }
}
