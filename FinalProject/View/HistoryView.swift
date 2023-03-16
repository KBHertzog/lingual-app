//
//  HistoryView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/12/22.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var sheetToggle : sheetDisplay?
    var body: some View {
        VStack{
            Text("History")
                .font(.title)
            Divider()
            ForEach(gameManager.previousGuesses,id:\.self){guess in
                Text(guess)
                    .foregroundColor(guess==gameManager.currentLang.name ? Color.green : Color.red)
            }
            if !gameManager.previousGuesses.isEmpty{
                Divider()
            }
            Button("Dismiss"){sheetToggle = nil}
        }
    }
}
