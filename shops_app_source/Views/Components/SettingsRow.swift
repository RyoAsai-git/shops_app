//
//  SettingsRow.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI

// 設定項目の行
struct SettingsRow: View {
    let title: String
    let icon: String
    var textColor: Color = .black
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(textColor)
                    .frame(width: 24)
                
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(textColor)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(Color.white)
        }
        .buttonStyle(PlainButtonStyle())
        
        Divider()
            .padding(.leading, 68)
    }
}

#Preview {
    VStack(spacing: 0) {
        SettingsRow(title: "利用規約", icon: "doc.text", action: {})
        SettingsRow(title: "ログアウト", icon: "rectangle.portrait.and.arrow.right", textColor: .blue, action: {})
    }
}
