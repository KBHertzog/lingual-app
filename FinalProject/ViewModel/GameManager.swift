//
//  GameManager.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import Foundation
import MapKit

class GameManager : ObservableObject{
    @Published var gameModel = GameModel()
    @Published var currentWord : Word
    @Published var currentGuess : Int
    @Published var currentLang : Language
    @Published var currentCountry : String
    @Published var gameWon : Bool = false
    @Published var gameOver : Bool = false
    @Published var previousGuesses = [String]()
    @Published var region : MKCoordinateRegion
    var countriesToShow : [Country] = []
    var hintOneGuess : String = ""
    var gameResult : String {
        var result = ""
        if currentGuess == 0{
            return result
        }
        for index in (0..<currentGuess-1){
            result.append("🟥")
        }
        if gameWon{
            result.append("🟩")
        }
        return result
    }
    var availableWords = [Word]()
    var favoritedLanguages : [Language] {gameModel.languageList.filter({$0.favoritedLanguage})}
    var studyLanguages : [Language] {gameModel.languageList.filter({$0.studyLanguage})}
    init(){
        currentWord = Word.standard
        currentGuess = 0
        currentLang = Language.standard
        currentCountry = ""
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    }
    
    func updateAvailableWords(){
        availableWords.removeAll()
        if favoritedLanguages.isEmpty && studyLanguages.isEmpty{
            availableWords = gameModel.wordList
            return
        }
        for lang in studyLanguages{
            availableWords.append(contentsOf: gameModel.wordList.filter({$0.language==lang.name}))
        }
        for lang in favoritedLanguages{
            for word in gameModel.wordList.filter({$0.language==lang.name}){
                if availableWords.contains(word){
                    break
                }
                availableWords.append(word)
            }
        }
    }
    
    func getWordLanguage()-> Language{
        for lang in gameModel.languageList{
            if lang.name == currentWord.language{
                return lang
            }
        }
        return Language.standard
    }
    
    func generateNewWord(){
        let randomIndex = Int.random(in: 0..<availableWords.count)
        currentWord = availableWords[randomIndex]
        currentLang = getWordLanguage()
        currentCountry = currentLang.countries.randomElement()!
    }
    
    func startNewGame(){
        currentGuess = 0
        gameWon = false
        gameOver = false
        previousGuesses.removeAll()
        updateAvailableWords()
        generateNewWord()
        filterCountriesByLanguage(lang: currentLang)
        updateCoords()
    }
    func hintOne(){
        let sameLanguageWords = gameModel.wordList.filter({$0.language==currentWord.language})
        var newWord = sameLanguageWords[Int.random(in: 0..<sameLanguageWords.count)].word
        while newWord == currentWord.word{
            newWord = sameLanguageWords[Int.random(in: 0..<sameLanguageWords.count)].word
        }
        hintOneGuess = newWord
    }
    
    func getWordByLanguage(lang: Language)->[Word]{
        return gameModel.wordList.filter({$0.language==lang.name})
    }
    
    func getWordByLanguageSorted(lang: Language)->[Word]{
        let wordsByLang = getWordByLanguage(lang: lang)
        return wordsByLang.sorted(by: {$0.word.localizedCompare($1.word) == .orderedAscending})
    }
    
    func guess(guess language : String)-> Bool{
        var validGuess = false
        let trimmedLang = language.trimmingCharacters(in: .whitespacesAndNewlines)
        for lang in gameModel.languageList{
            if trimmedLang.compare(lang.name, options: .caseInsensitive) == ComparisonResult.orderedSame{
                validGuess=true
                break
            }
        }
        
        if !validGuess{
            return validGuess
        }
        
        if trimmedLang.compare(currentLang.name, options: .caseInsensitive) == ComparisonResult.orderedSame{
            gameWon=true
            gameOver = true
        }else if currentGuess == 5{
            gameOver = true
        }
        currentGuess+=1
        if currentGuess==1{
            hintOne()
        }
        previousGuesses.append(trimmedLang)
        return validGuess
    }
    
    func setStudyLangFam(langFam : String, setter : Bool){
        for index in (0..<gameModel.languageList.count){
            if gameModel.languageList[index].family==langFam{
                gameModel.languageList[index].studyLanguage=setter
            }
        }
    }
    
    func clear(){
        for index in (0..<gameModel.languageList.count){
            gameModel.languageList[index].favoritedLanguage = false
            gameModel.languageList[index].studyLanguage = false
        }
    }
    
    func filterCountriesByLanguage(lang : Language){
        countriesToShow = gameModel.countriesList.filter({$0.languages.contains(lang.name)})
    }
    
    func updateCoords(){
        if !countriesToShow.isEmpty{
            let minLat = countriesToShow.min(by: {$0.latitude<$1.latitude})!.latitude
            let maxLat = countriesToShow.max(by: {$0.latitude<$1.latitude})!.latitude
            let minLong = countriesToShow.min(by: {$0.longitude<$1.longitude})!.longitude
            let maxLong = countriesToShow.max(by: {$0.longitude<$1.longitude})!.longitude
            
            let avgLat = (minLat + maxLat)/2
            let avgLong = (minLong + maxLong)/2
            let latSpan = maxLat - minLat + 5
            let longSpan = maxLong - minLong + 5
            region.center = CLLocationCoordinate2D(latitude: avgLat, longitude: avgLong)
            region.span = MKCoordinateSpan(latitudeDelta: latSpan, longitudeDelta: longSpan)
        }
    }
}
