//
//  ContentView.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI
import MapKit

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
            // 地図表示エリア（MapKit使用）
            Map(coordinateRegion: $region, annotationItems: shops) { shop in
                MapAnnotation(coordinate: shop.coordinate) {
                    VStack(spacing: 4) {
                        // 青いピン
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 60, height: 60)
                            
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 8, height: 8)
                                )
                        }
                        
                        // ショップアイコン
                        Image(systemName: "tshirt")
                            .font(.system(size: 20))
                            .foregroundColor(.cyan)
                            .padding(.top, -10)
                        
                        // ショップ名
                        Text(shop.name)
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                // 検索バー（地図の上に配置）
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        
                        TextField("ショップ名を検索", text: $searchText)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Spacer()
            }
            
            // 地図上の操作ボタン
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        // 現在地ボタン
                        Button(action: {
                            // 現在地に戻る処理
                        }) {
                            Image(systemName: "location.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                        }
                        
                        // 地図タイプ切り替えボタン
                        Button(action: {
                            // 地図タイプ切り替え処理
                        }) {
                            Image(systemName: "map")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.green)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 100)
                }
            }
            
            // フッター
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
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color(.systemGray4)),
                    alignment: .top
                )
            }
        }
        .background(Color.white)
        .navigationBarHidden(true)
    }
}

// ショップデータモデル
struct Shop: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let category: String
}

#Preview {
    ContentView()
}
