//
//  DatasetSelectionView.swift
//  CustomSwitchStyle
//
//  Created by Pratik on 06/10/22.
//

import SwiftUI

struct DatasetSelectionView: View {
    @Binding var selectedDataset: Dataset
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                PolyShape(count: 6, cornerRadius: 80)
                    .fill(LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: ThemeManager.shadowDark, location: 0.25),
                        Gradient.Stop(color: ThemeManager.shadowLight, location: 0.9),
                    ]),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
                
                ZStack {
                    ForEach(Dataset.allCases) { dataset in
                        VStack {
                            Button {
                                withAnimation {
                                    selectedDataset = dataset
                                }
                            } label: {
                                Image(systemName: dataset.icon)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .rotationEffect(.degrees(-getAngle(for: dataset)))
                                    .foregroundColor(dataset == selectedDataset ? dataset.color : ThemeManager.lightTextColor)
                                    .shadow(color: ThemeManager.shadowDark, radius: 20, x: 0, y: 0)
                            }
                            .buttonStyle(.plain)
                        }
                        .offset(x: (bounds.size.width / 2) - 50)
                        .rotationEffect(.degrees(getAngle(for: dataset)))
                    }
                }
                
                Circle()
                    .fill(ThemeManager.circleColor)
                    .frame(width: bounds.size.width / 2, height: bounds.size.width / 2, alignment: .center)
                    .shadow(color: ThemeManager.chartLightShadow.opacity(0.7), radius: 30, x: -20, y: -20)
                    .shadow(color: ThemeManager.chartDarkShadow.opacity(0.7), radius: 30, x: 20, y: 20)
                    .overlay {
                        GeometryReader { geo in
                            ZStack {
                                VStack {
                                    Circle()
                                        .fill(ThemeManager.darkTextColor)
                                        .frame(width: 10, height: 10)
                                        .offset(x: (geo.size.width/2) - 20)
                                }
                                .rotationEffect(.degrees(getAngle(for: selectedDataset)))
                                
                                
                                VStack {
                                    Text("\(selectedDataset.value)")
                                        .font(.system(size: 50, weight: .light, design: .rounded))
                                        .foregroundColor(ThemeManager.darkTextColor)
                                    
                                    Text(selectedDataset.unit)
                                        .font(.system(size: 20, weight: .medium, design: .rounded))
                                        .foregroundColor(ThemeManager.lightTextColor)
                                }
                                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                            }
                        }
                    }
            }
        }
    }
    
    private func getCurrentIndex(for dataset: Dataset) -> Int {
        Dataset.allCases.firstIndex(of: dataset) ?? 0
    }
    
    private func getAngle(for dataset: Dataset) -> Double {
        idleAngle * Double(getCurrentIndex(for: dataset))
    }
    
    private var idleAngle: Double {
        360 / Double(Dataset.allCases.count)
    }
}

struct DatasetSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ThemeManager.backgroundColor
                .ignoresSafeArea()
            
            DatasetSelectionView(selectedDataset: .constant(.water))
        }
        .preferredColorScheme(.dark)
    }
}
