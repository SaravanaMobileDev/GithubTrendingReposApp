//
//  EmptyBannerView.swift
//  GithubTrendingReposApp
//
//  Created by Saravana Ganesh L on 26/06/26.
//

import SwiftUI

struct EmptyBannerView: View {
    let message: String
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "wifi.exclamationmark")
            
            Text(message)
                .font(.subheadline)
            
            Spacer()
        }
        .foregroundStyle(.white)
        .padding()
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 6)
    }
}

#Preview {
    EmptyBannerView(message: "no data")
}
