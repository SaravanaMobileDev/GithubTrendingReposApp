//
//  AvatarView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct AvatarView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { res in
            switch res {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
            default:
                ProgressView()
            }
            
        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())
    }
}

#Preview {
//    AvatarView()
}
