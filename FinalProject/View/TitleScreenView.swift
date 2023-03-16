//
//  TitleScreenView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

struct TitleScreenView: View {
    var body: some View {
        VStack{
            LogoView()
            MainMenuButtonsView()
        }
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
    }
}
