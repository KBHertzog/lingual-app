//
//  LanguageListView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

struct LanguageListView: View {
    @EnvironmentObject var gameManager : GameManager
    var body: some View {
        List{
            if (!gameManager.favoritedLanguages.isEmpty){
                Section(header: Text("Favorited Languages")){
                    ForEach ($gameManager.gameModel.languageList){ $lang in
                        if lang.favoritedLanguage{
                            NavigationLink(destination: LanguageDetailView(lang: $lang),label: {Text(lang.name)})
                        }
                    }
                }
            }
            if (!gameManager.studyLanguages.isEmpty){
                Section(header: Text("Study Languages")){
                    ForEach ($gameManager.gameModel.languageList){ $lang in
                        if lang.studyLanguage{
                            NavigationLink(destination: LanguageDetailView(lang: $lang),label: {Text(lang.name)})
                        }
                    }
                }
            }
            ForEach ($gameManager.gameModel.languageList){ $lang in
                NavigationLink(destination: LanguageDetailView(lang: $lang),label: {Text(lang.name)})
            }
        }
        .background(ViewConstants.appBackground)
        .navigationBarTitle("Languages")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Clear"){
                    gameManager.clear()
                }
            }
        }
    }
}

struct LanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageListView()
    }
}
