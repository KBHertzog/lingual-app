//
//  LanguageDetailView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

struct LanguageDetailView: View {
    @EnvironmentObject var gameManager : GameManager
    @Binding var lang : Language
    var favText : String{return lang.favoritedLanguage ? "Unfavorite" : "Favorite"}
    var studyLangText : String{return lang.studyLanguage ? "Remove" : "Add"}
    var body: some View {
        ZStack{
            ViewConstants.appBackground.ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        Text("Language Family:")
                        Text(lang.family)
                    }
                    .font(.title2)
                    Button(favText){
                        lang.favoritedLanguage.toggle()
                    }
                    .buttonStyle(ClassicButtonStyle(color: lang.favoritedLanguage ? Color.red : ViewConstants.appGreen))
                    Button(studyLangText){lang.studyLanguage.toggle()}
                    .buttonStyle(ClassicButtonStyle(color: lang.studyLanguage ? Color.red : ViewConstants.appGreen))
                    Button("Add Family"){gameManager.setStudyLangFam(langFam: lang.family,setter: true)}
                    .buttonStyle(ClassicButtonStyle(color: ViewConstants.appGreen))
                    Button("Remove Family"){gameManager.setStudyLangFam(langFam: lang.family,setter: false)}
                    .buttonStyle(ClassicButtonStyle(color: Color.red))
                }
                Divider()
                Text("Study")
                ScrollView{
                    ForEach(gameManager.getWordByLanguageSorted(lang: lang)){word in
                        CardFlip(word: word)
                    }
                }
                .navigationTitle(lang.name)
            }
        }
    }
}
