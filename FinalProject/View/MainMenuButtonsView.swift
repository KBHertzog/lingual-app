//
//  MainMenuButtonsView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

struct MainMenuButtonsView: View {
    @EnvironmentObject var gameManager : GameManager
    var body: some View {
        VStack{
            NavigationLink("Start", destination: GameScreenView().onAppear(perform: {gameManager.startNewGame()}))
                .buttonStyle(MainMenuButtonStyle())
            NavigationLink("Map", destination: MapView(showAll: true))
                .buttonStyle(MainMenuButtonStyle())
            NavigationLink("Languages", destination: LanguageListView())
                .buttonStyle(MainMenuButtonStyle())
            Spacer()
        }
        
    }
}

struct MainMenuButtonStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 25))
            .frame(maxWidth: 150, maxHeight: 45, alignment: .center)
            .background(ViewConstants.appBlue)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black))
            .padding(10)
    }
}

struct MainMenuButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuButtonsView()
    }
}
