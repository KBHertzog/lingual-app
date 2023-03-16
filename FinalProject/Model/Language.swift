//
//  Language.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/7/22.
//

import Foundation

struct Language : Codable, Identifiable{
    let name : String
    let family : String
    let continent : String
    let countries : [String]
    var favoritedLanguage : Bool
    var studyLanguage : Bool
    var id : String {name}
    
    static let standard = Language(name: "English", family: "Germanic", continent: "Europe", countries: ["A lot"], favoritedLanguage: false, studyLanguage: false)
    
//    init(name: String, family : String, continent : String, countries: [String]){
//        self.name = name
//        self.family = family
//        self.continent = continent
//        self.countries = countries
//        favoritedLanguage = false
//    }
    
}
extension Language{
    enum CodingKeys : String, CodingKey{
        case name
        case family
        case continent
        case countries
        case favoritedLanguage
        case studyLanguage
    }
    
    init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        family = try values.decode(String.self, forKey: .family)
        continent = try values.decode(String.self, forKey: .continent)
        countries = try values.decode([String].self, forKey: .countries)
        favoritedLanguage = try values.decodeIfPresent(Bool.self, forKey: .favoritedLanguage) ?? false
        studyLanguage = try values.decodeIfPresent(Bool.self, forKey: .studyLanguage) ?? false
    }
}
extension Language : Equatable{
    static func == (lhs: Language, rhs: Language) -> Bool {
        return
            lhs.name == rhs.name
    }
}
