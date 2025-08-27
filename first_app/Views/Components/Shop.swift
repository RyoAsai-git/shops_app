//
//  Shop.swift
//  first_app
//
//  Created by RyoAsai on 2025/08/24.
//

import Foundation
import CoreLocation

// ショップデータモデル
struct Shop: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let category: String
}
