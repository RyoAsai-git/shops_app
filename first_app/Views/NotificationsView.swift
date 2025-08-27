//
//  NotificationsView.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI

// お知らせ画面
struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("お知らせ")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 60)
            
            Spacer()
            
            Text("通知がここに表示されます")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    NotificationsView()
}
