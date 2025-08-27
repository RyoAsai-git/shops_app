//
//  ContentView.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6762, longitude: 139.6503), // 東京
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    // サンプルのショップデータ
    let shops = [
        Shop(name: "古着屋 ロビンソン", coordinate: CLLocationCoordinate2D(latitude: 35.6762, longitude: 139.6503), category: "古着"),
        Shop(name: "セレクトショップ A", coordinate: CLLocationCoordinate2D(latitude: 35.6765, longitude: 139.6505), category: "セレクト"),
        Shop(name: "ブランドショップ B", coordinate: CLLocationCoordinate2D(latitude: 35.6759, longitude: 139.6501), category: "ブランド")
    ]
    
    var body: some View {
        ZStack {
            // 背景色
            Color.white.ignoresSafeArea()
            
            // タブに応じた画面表示
            if selectedTab == 0 {
                // ホーム画面（地図 + 検索バー）
                HomeView(searchText: $searchText, region: $region, shops: shops)
            } else if selectedTab == 1 {
                // お気に入り画面
                FavoritesView()
            } else if selectedTab == 2 {
                // お知らせ画面
                NotificationsView()
            } else if selectedTab == 3 {
                // 設定画面
                SettingsView()
            }
            
            // フッター（常に表示）
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    // ホーム
                    VStack(spacing: 4) {
                        Image(systemName: "house")
                            .font(.system(size: 24))
                            .foregroundColor(selectedTab == 0 ? .black : .gray)
                        Text("ホーム")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == 0 ? .black : .gray)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selectedTab = 0
                    }
                    
                    // お気に入り
                    VStack(spacing: 4) {
                        Image(systemName: "heart")
                            .font(.system(size: 24))
                            .foregroundColor(selectedTab == 1 ? .black : .gray)
                        Text("お気に入り")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == 1 ? .black : .gray)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selectedTab = 1
                    }
                    
                    // お知らせ
                    VStack(spacing: 4) {
                        ZStack {
                            Image(systemName: "bell")
                                .font(.system(size: 24))
                                .foregroundColor(selectedTab == 2 ? .black : .gray)
                            
                            // 通知バッジ
                            Circle()
                                .fill(Color.pink)
                                .frame(width: 8, height: 8)
                                .offset(x: 8, y: -8)
                        }
                        Text("お知らせ")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == 2 ? .black : .gray)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selectedTab = 2
                    }
                    
                    // 設定
                    VStack(spacing: 4) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .foregroundColor(selectedTab == 3 ? .black : .gray)
                        Text("設定")
                            .font(.system(size: 10))
                            .foregroundColor(selectedTab == 3 ? .black : .gray)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selectedTab = 3
                    }
                }
                .padding(.vertical, 12)
                .background(Color.white)
            }
        }
        .background(Color.white)
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
    }
}

#Preview {
    ContentView()
}
