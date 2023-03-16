//
//  country.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/29/22.
//

import Foundation

struct Country : Identifiable{
    var country : String
    var languages : [String]
    var latitude : Double
    var longitude : Double
    var capital : String
    var id = UUID()
    
    static let standard = Country(country: "Atlantis", languages: ["Gibberish"], latitude: 0.0, longitude: 0.0, capital: "Atlantia")
}
