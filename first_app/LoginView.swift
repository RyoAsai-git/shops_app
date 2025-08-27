//
//  LoginView.swift
//  first_app
//
//  Created by Ryo Asai on 2025/08/24.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // アプリロゴとタイトル
                VStack(spacing: 16) {
                    // ロゴ（位置情報マーカー）
                    ZStack {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.black)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 20, height: 20)
                            .offset(x: 0, y: -2)
                    }
                    
                    // アプリ名
                    VStack(spacing: 0) {
                        Text("Shops")
                            .font(.system(size: 32, weight: .bold, design: .default))
                            .foregroundColor(.black)
                    }
                }
                .padding(.top, 80)
                
                Spacer()
                
                // ログインオプション
                VStack(spacing: 16) {
                    // Appleでログイン
                    Button(action: {
                        // Appleログイン処理
                    }) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .font(.system(size: 20))
                            Text("Appleでログイン")
                                .font(.system(size: 16, weight: .medium))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.black, lineWidth: 1)
                        )
                    }
                    
                    // Googleでログイン
                    Button(action: {
                        // Googleログイン処理
                    }) {
                        HStack {
                            Image(systemName: "g.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Text("Googleでログイン")
                                .font(.system(size: 16, weight: .medium))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.black, lineWidth: 1)
                        )
                    }
                    
                    // ログインせずにはじめる
                    Button(action: {
                        isLoggedIn = true
                    }) {
                        Text("ログインせずにはじめる")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.black)
                            .cornerRadius(25)
                    }
                    
                    // 注意書き
                    Text("未ログイン時は一部機能が利用できません")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                // 法的情報へのリンク
                VStack(spacing: 8) {
                    Button("利用規約") {
                        // 利用規約表示
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    
                    Button("プライバシーポリシー") {
                        // プライバシーポリシー表示
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                }
                .padding(.bottom, 50)
            }
            .background(.white)
            .navigationBarHidden(true)
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            ContentView()
        }
    }
}

#Preview {
    LoginView()
}
