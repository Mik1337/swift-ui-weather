//
//  ButtonView.swift
//  weather
//
//  Created by mik on 15/11/23.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 24, weight:.medium))
            .foregroundColor(textColor)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
