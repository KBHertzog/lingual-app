//
//  ClassicButtonStyle.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/12/22.
//

import SwiftUI

struct ClassicButtonStyle: ButtonStyle {
    let color : Color
    func makeBody(configuration : ButtonStyleConfiguration)-> some View{
        configuration.label
            .frame(width: 130, height: 30, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black))
    }
}
