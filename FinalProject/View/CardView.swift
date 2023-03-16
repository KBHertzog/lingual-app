//
//  CardView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/11/22.
//

import SwiftUI

struct CardView: View {
    var tts : String
    var displayColor : Color
    var body: some View {
        ZStack{
            displayColor
            Text(tts)
            .padding(30)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(2)
        
    }
}
