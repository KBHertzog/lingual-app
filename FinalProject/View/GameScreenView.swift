//
//  GameScreenView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

enum sheetDisplay : Identifiable{
    case history, list
    var id : Int{
        hashValue
    }
}

struct GameScreenView: View {
    @EnvironmentObject var gameManager : GameManager
    @State var currentLanguageGuess : String = ""
    @State private var sheets : sheetDisplay?
    @State private var wrongGuess = false
    @State private var showMap = false
    var body: some View {
        ZStack{
            ViewConstants.appBackground.ignoresSafeArea()
            VStack{
                Text(gameManager.currentWord.word)
                    .font(.largeTitle)
                    .frame(alignment: .top)
                Divider()
                    .padding(5)
                
                if !gameManager.gameOver{
                    HintsView()
                        .font(.system(size: 25))
                }else{
                    GameEndView()
                }
                Divider()
                    .padding(5)
                if !gameManager.gameOver{
                    if gameManager.currentGuess>=1 && !gameManager.gameOver{
                        Text("Wrong Answer ❌")
                    }
                    TextField("Make your Guess", text: $currentLanguageGuess)
                        .frame(width: 200, height: 30, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .disabled(gameManager.gameOver)
                        .onSubmit {
                            if !gameManager.guess(guess: currentLanguageGuess){
                                wrongGuess=true
                            }
                            currentLanguageGuess = ""
                        }
                    HStack{
                        Button("Submit"){
                            if !gameManager.guess(guess: currentLanguageGuess){
                                wrongGuess=true
                            }
                            currentLanguageGuess = ""
                        }
                        .buttonStyle(ClassicButtonStyle(color: ViewConstants.appBlue))
                        .disabled(gameManager.gameOver)
                    }
                }
                else if !showMap{
                    Button(action: {showMap.toggle()}, label: {VStack{Text("Show Map").foregroundColor(Color.black);Image("AppLogo").resizable().aspectRatio(contentMode: .fit)}})
                        .padding()
                }
                
                
            }
            .alert("Invalid Guess. Make sure the language being guessed is in the language list", isPresented: $wrongGuess){
                Button("Try again"){
                    wrongGuess=false
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Map"){
                        showMap.toggle()
                    }
                    .opacity(gameManager.gameOver ? 1.0 : 0.0)
                    .foregroundColor(showMap ? Color.black : Color.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Languages"){
                        sheets = .list
                    }
                    .foregroundColor(showMap ? Color.black : Color.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("History"){
                        sheets = .history
                    }
                    .foregroundColor(showMap ? Color.black : Color.blue)
                }
            }
            .sheet(item: $sheets, onDismiss: {}){item in
                switch item{
                case .history:
                    ZStack{
                        ViewConstants.appBackground.ignoresSafeArea()
                        HistoryView(sheetToggle: $sheets)
                    }
                case .list:
                    LanguageSheetView(sheetToggle: $sheets)
                }
                
            }
            MapView(showAll: false)
                .opacity(showMap ? 1.0 : 0.0)
        }
        
    }
}

struct GameScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GameScreenView()
    }
}
