//
//  HintsView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

struct HintsView: View {
    @EnvironmentObject var gameManager : GameManager
    var body: some View {
        VStack(){
            HStack{
                Text("Hints")
                    .frame(alignment: .center)
                Text("\(gameManager.currentGuess)/6")
                    .frame(alignment: .trailing)
            }
            if (gameManager.currentGuess >= 1){
                Text(gameManager.hintOneGuess)
            }
            if (gameManager.currentGuess >= 2){
                Text(gameManager.currentWord.translation)
            }
            if (gameManager.currentGuess >= 3){
                Text(gameManager.currentLang.family)
            }
            if (gameManager.currentGuess >= 4){
                Text(gameManager.currentLang.continent)
            }
            if (gameManager.currentGuess == 5){
                Text(gameManager.currentCountry)
            }
        }
        .minimumScaleFactor(0.4)
    }
}

struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView()
    }
}
