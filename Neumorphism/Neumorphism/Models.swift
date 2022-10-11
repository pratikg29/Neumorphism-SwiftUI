//
//  Models.swift
//  CustomSwitchStyle
//
//  Created by Pratik on 06/10/22.
//

import SwiftUI


enum Dataset: CaseIterable, Identifiable {
    case menu
    case temprature
    case energy
    case temp
    case heartRate
    case water
    
    var id: String {
        icon
    }
    
    var icon: String {
        switch self {
        case .water:
            return "drop.fill"
        case .heartRate:
            return "heart.fill"
        case .energy:
            return "bolt.fill"
        case .temprature:
            return "sun.max.circle.fill"
        case .menu:
            return "square.stack.3d.forward.dottedline.fill"
        case .temp:
            return "aqi.medium"
        }
    }
    
    var title: String {
        switch self {
        case .water:
            return "Water"
        case .heartRate:
            return "Heart Rate"
        case .energy:
            return "Active Energy"
        case .temprature:
            return "Temprature"
        case .menu:
            return "Presure"
        case .temp:
            return "Humidity"
        }
    }
    
    var value: Int {
        switch self {
        case .water:
            return 250
        case .heartRate:
            return 120
        case .energy:
            return 430
        case .temprature:
            return 98
        case .menu:
            return 120
        case .temp:
            return 50
        }
    }
    
    var unit: String {
        switch self {
        case .water:
            return "ml"
        case .heartRate:
            return "bpm"
        case .energy:
            return "kcal"
        case .temprature:
            return "c"
        case .menu:
            return "mm Hg"
        case .temp:
            return "%"
        }
    }
    
    var color: Color {
        switch self {
        case .menu:
            return .mint
        case .temprature:
            return ThemeManager.tempratureColor
        case .energy:
            return ThemeManager.energyColor
        case .temp:
            return .teal
        case .heartRate:
            return ThemeManager.heartRateColor
        case .water:
            return ThemeManager.waterColor
        }
    }
}

struct ValueModel: Identifiable, Comparable {
    static func < (lhs: ValueModel, rhs: ValueModel) -> Bool {
        lhs.value < rhs.value
    }
    
    var value: Int
    var dataset: Dataset
    var time: String
    var isCurrent: Bool = false
    var id: String { time }
    
    static let waterData: [ValueModel] = [
        ValueModel(value: 40, dataset: .water, time: "7am"),
        ValueModel(value: 50, dataset: .water, time: "8am"),
        ValueModel(value: 30, dataset: .water, time: "9am"),
        ValueModel(value: 120, dataset: .water, time: "10am"),
        ValueModel(value: 100, dataset: .water, time: "11am"),
        ValueModel(value: 80, dataset: .water, time: "12am", isCurrent: true)
    ]
    
    static let heartRateData: [ValueModel] = [
        ValueModel(value: 90, dataset: .heartRate, time: "7am"),
        ValueModel(value: 80, dataset: .heartRate, time: "8am"),
        ValueModel(value: 100, dataset: .heartRate, time: "9am"),
        ValueModel(value: 95, dataset: .heartRate, time: "10am"),
        ValueModel(value: 60, dataset: .heartRate, time: "11am"),
        ValueModel(value: 75, dataset: .heartRate, time: "12am", isCurrent: true)
    ]
    
    static let energyData: [ValueModel] = [
        ValueModel(value: 300, dataset: .energy, time: "7am"),
        ValueModel(value: 200, dataset: .energy, time: "8am"),
        ValueModel(value: 450, dataset: .energy, time: "9am"),
        ValueModel(value: 520, dataset: .energy, time: "10am"),
        ValueModel(value: 250, dataset: .energy, time: "11am"),
        ValueModel(value: 350, dataset: .energy, time: "12am", isCurrent: true)
    ]
    
    static let tempratureData: [ValueModel] = [
        ValueModel(value: 30, dataset: .temprature, time: "7am"),
        ValueModel(value: 45, dataset: .temprature, time: "8am"),
        ValueModel(value: 25, dataset: .temprature, time: "9am"),
        ValueModel(value: 35, dataset: .temprature, time: "10am"),
        ValueModel(value: 50, dataset: .temprature, time: "11am"),
        ValueModel(value: 28, dataset: .temprature, time: "12am", isCurrent: true)
    ]
    
    static let menuData: [ValueModel] = [
        ValueModel(value: 300, dataset: .menu, time: "7am"),
        ValueModel(value: 200, dataset: .menu, time: "8am"),
        ValueModel(value: 450, dataset: .menu, time: "9am"),
        ValueModel(value: 520, dataset: .menu, time: "10am"),
        ValueModel(value: 250, dataset: .menu, time: "11am"),
        ValueModel(value: 350, dataset: .menu, time: "12am", isCurrent: true)
    ]
    
    static let tempData: [ValueModel] = [
        ValueModel(value: 30, dataset: .temp, time: "7am"),
        ValueModel(value: 45, dataset: .temp, time: "8am"),
        ValueModel(value: 25, dataset: .temp, time: "9am"),
        ValueModel(value: 35, dataset: .temp, time: "10am"),
        ValueModel(value: 50, dataset: .temp, time: "11am"),
        ValueModel(value: 28, dataset: .temp, time: "12am", isCurrent: true)
    ]
}
