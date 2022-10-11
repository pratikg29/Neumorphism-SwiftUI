//
//  ChartView.swift
//  CustomSwitchStyle
//
//  Created by Pratik on 06/10/22.
//

import SwiftUI

struct ChartView: View {
    var dataArr: [ValueModel]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(dataArr) { model in
                BarView(model: model, progress: progress(for: model.value))
            }
        }
    }
    
    private func progress(for value: Int) -> CGFloat {
        let max = dataArr.max(by: <)?.value ?? 1
        return CGFloat(value) / CGFloat(max)
    }
    
    struct BarView: View {
        var model: ValueModel
        var progress: CGFloat
        
        var body: some View {
            GeometryReader { bounds in
                VStack {
                    Spacer(minLength: 0)
                    Text("\(model.value)")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(model.isCurrent ? ThemeManager.darkTextColor : ThemeManager.lightTextColor)
                    
                    
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(model.isCurrent ? model.dataset.color : ThemeManager.barFillColor)
                        .frame(height: getBarHeight(bounds: bounds))
//                        .blur(radius: 1.3)
                        .shadow(color: model.isCurrent ? model.dataset.color.opacity(0.5) : ThemeManager.chartLightShadow, radius: 5, x: -3, y: -3)
//                        .shadow(color: ThemeManager.chartDarkShadow, radius: 5, x: 3, y: 3)
                        
                    Text(model.time)
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(ThemeManager.lightTextColor)
                }
            }
        }
        
        private func getBarHeight(bounds: GeometryProxy) -> CGFloat {
            (bounds.size.height - 50) * progress
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ThemeManager.backgroundColor
                .ignoresSafeArea()
            
            ChartView(dataArr: ValueModel.waterData)
                .frame(height: 250)
                .padding(30)
        }
        .preferredColorScheme(.dark)
    }
}
