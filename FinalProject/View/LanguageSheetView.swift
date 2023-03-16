//
//  LanguageSheetView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 5/1/22.
//

import SwiftUI

struct LanguageSheetView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var sheetToggle : sheetDisplay?
    var body: some View {
        ScrollView{
            Spacer()
            Text("Valid languages")
                .font(.title)
            ForEach(gameManager.gameModel.languageList){lang in
                Text(lang.name)
                    .padding(2)
            }
            Button("Dismiss"){sheetToggle = nil}
        }
    }
}
