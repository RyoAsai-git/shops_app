//
//  SettingsView.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI

// 設定画面
struct SettingsView: View {
    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー
            VStack {
                Text("設定")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 60) // ノッチの高さを考慮
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
            // 設定項目リスト
            VStack(spacing: 0) {
                // 利用規約
                SettingsRow(title: "利用規約", icon: "doc.text", action: {
                    // 利用規約表示処理
                })
                
                // プライバシーポリシー
                SettingsRow(title: "プライバシーポリシー", icon: "hand.raised", action: {
                    // プライバシーポリシー表示処理
                })
                
                // お問い合わせ
                SettingsRow(title: "お問い合わせ", icon: "envelope", action: {
                    // お問い合わせ処理
                })
                
                // レビューを書く
                SettingsRow(title: "レビューを書く", icon: "star", action: {
                    // レビュー処理
                })
                
                // ログアウト
                SettingsRow(title: "ログアウト", icon: "rectangle.portrait.and.arrow.right", textColor: .blue, action: {
                    // ログアウト処理
                })
            }
            .background(Color.white)
            
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    SettingsView()
}
