//
//  MainScreenView.swift
//  CustomSwitchStyle
//
//  Created by Pratik on 06/10/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var dataArr: [ValueModel] = ValueModel.waterData
    @State private var selectedDataset: Dataset = .water
    @State private var isLightMode: Bool = false
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                ThemeManager.backgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    headerView
                        .padding(.horizontal, 30)
                    
                    DatasetSelectionView(selectedDataset: $selectedDataset)
                        .frame(height: bounds.size.width, alignment: .center)
                    
                    Spacer(minLength: 0)
                    chartSection
                        .padding(.horizontal, 30)
                }
            }
        }
        .preferredColorScheme(isLightMode ? .light : .dark)
        .onChange(of: selectedDataset) { newValue in
            withAnimation {
                switch newValue {
                case .temprature:
                    dataArr = ValueModel.tempratureData
                case .energy:
                    dataArr = ValueModel.energyData
                case .heartRate:
                    dataArr = ValueModel.heartRateData
                case .water:
                    dataArr = ValueModel.waterData
                case .temp:
                    dataArr = ValueModel.tempData
                case .menu:
                    dataArr = ValueModel.menuData
                }
            }
        }
    }
    
    @ViewBuilder private var headerView: some View {
        HStack {
            Text(selectedDataset.title)
                .font(.system(size: 25, weight: .semibold, design: .rounded))
            .foregroundColor(ThemeManager.lightTextColor)
            
            Spacer()
            
            Toggle("", isOn: $isLightMode.animation(.easeInOut))
                .frame(width: 50, height: 25, alignment: .center)
                .toggleStyle(AppearanceToggleStyle())
        }
    }
    
    @ViewBuilder private var chartSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label("Average", systemImage: "chart.xyaxis.line")
                .foregroundColor(ThemeManager.lightTextColor)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            
            ChartView(dataArr: dataArr)
                .frame(height: 250)
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
