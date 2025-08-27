//
//  HomeView.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import SwiftUI
import MapKit
import CoreLocation

// ホーム画面（地図 + 検索バー + 操作ボタン）
struct HomeView: View {
    @Binding var searchText: String
    @Binding var region: MKCoordinateRegion
    let shops: [Shop]
    
    var body: some View {
        ZStack {
            // 地図表示エリア
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
            .ignoresSafeArea(.all, edges: [.top, .leading, .trailing])
            
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
                .padding(.top, 15) // Google MapsやiOSマップと同じ位置感
                
                Spacer()
            }
            
            // 地図上の操作ボタン
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 12) {
                        // 現在地ボタン（MapKit標準スタイル）
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
                        
                        // 地図タイプ切り替えボタン（MapKit標準スタイル）
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
        }
    }
}

#Preview {
    HomeView(
        searchText: .constant(""),
        region: .constant(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.6762, longitude: 139.6503),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )),
        shops: [
            Shop(name: "古着屋 ロビンソン", coordinate: CLLocationCoordinate2D(latitude: 35.6762, longitude: 139.6503), category: "古着"),
            Shop(name: "セレクトショップ A", coordinate: CLLocationCoordinate2D(latitude: 35.6765, longitude: 139.6505), category: "セレクト")
        ]
    )
}
