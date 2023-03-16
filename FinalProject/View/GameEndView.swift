//
//  GameEndView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/12/22.
//

import SwiftUI

struct GameEndView: View {
    @EnvironmentObject var gameManager : GameManager
    private var endText : String {gameManager.gameWon ? "Congratulations!" : "Better Luck Next Time"}
    var body: some View {
            VStack{
                Text(endText)
                Text("Correct Answer: \(gameManager.currentLang.name)")
                Text("\(gameManager.currentGuess) guess(es)")
                    .padding(3)
                Text(gameManager.gameResult)
                Button("Share with friends"){
                    UIPasteboard.general.string = "\(gameManager.currentWord.word)  \(gameManager.gameResult)"
                }
                .minimumScaleFactor(0.4)
                .buttonStyle(ClassicButtonStyle(color: ViewConstants.appBlue))
                Button("Restart Game"){gameManager.startNewGame()}
                .buttonStyle(ClassicButtonStyle(color: ViewConstants.appGreen))
            }
    }
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView()
    }
}
