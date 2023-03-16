//
//  Word.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/7/22.
//

import Foundation

class Word : Identifiable{
    var word : String
    var language : String
    var translation : String
    var id = UUID()
    init (word: String, origin: String, translate: String){
        self.word = word
        language = origin
        translation = translate
    }
    
    static let standard = Word(word: "Agh", origin: "Gibberish", translate: "none")
}

extension Word : Equatable{
        static func == (lhs: Word, rhs: Word) -> Bool {
            return
                lhs.word == rhs.word &&
                lhs.language == rhs.language
        }
}
