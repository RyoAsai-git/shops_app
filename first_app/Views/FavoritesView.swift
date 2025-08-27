//
//  FavoritesView.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI

// お気に入り画面
struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("お気に入り")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 60)
            
            Spacer()
            
            Text("お気に入りのショップがここに表示されます")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    FavoritesView()
}
