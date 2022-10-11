//
//  CustomToggleStyle.swift
//  CustomSwitchStyle
//
//  Created by Pratik on 06/10/22.
//

import SwiftUI

struct AppearanceToggleStyle: ToggleStyle {
    @Namespace private var namespace
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { bounds in
            Button {
                configuration.isOn.toggle()
            } label: {
                ZStack {
                    Capsule(style: .circular)
                        .stroke(lineWidth: 2)
                        .foregroundColor(ThemeManager.lightTextColor)
                    
                    HStack(spacing: 0) {
                        
                        if configuration.isOn {
                            Circle()
                                .fill(ThemeManager.barFillColor)
                                .overlay {
                                    Image(systemName: "sun.max.fill")
                                        .font(.headline)
                                        .foregroundColor(ThemeManager.tempratureColor)
                                    
                                }
                                .frame(width: bounds.size.height, height: bounds.size.height, alignment: .center)
                                .matchedGeometryEffect(id: "MyToggle", in: namespace)
                            
                            Spacer()
                        } else {
                            Spacer()
                            
                            Circle()
                                .fill(ThemeManager.barFillColor)
                                .overlay {
                                    Image(systemName: "moon.fill")
                                        .font(.headline)
                                        .foregroundColor(ThemeManager.energyColor)
                                }
                                .frame(width: bounds.size.height, height: bounds.size.height, alignment: .center)
                                .matchedGeometryEffect(id: "MyToggle", in: namespace)
                        }
                    }
                    .frame(width: bounds.size.width, alignment: .center)
                }
            }
            .frame(height: bounds.size.width/2, alignment: .center)
            .buttonStyle(.plain)
        }
    }
}
