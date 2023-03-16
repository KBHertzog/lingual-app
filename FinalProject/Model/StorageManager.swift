//
//  StorageManager.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import Foundation

struct StorageManager<T:Codable>{
    var modelData : [T]
    let filename : String
    let fileInfo : FileInfo
    
    init(name:String){
        filename = name
        fileInfo = FileInfo(for: filename)
        if fileInfo.exists{
            let decoder = JSONDecoder()
            do{
                let data = try Data(contentsOf: fileInfo.url)
                modelData = try decoder.decode([T].self, from: data)
            } catch{
                print(error)
                modelData = []
            }
            return
        }
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")
        
        guard let url = url else {modelData = []; return}
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            modelData = try decoder.decode([T].self, from: data)
        } catch{
            print(error)
            modelData = []
        }
    }
    
    func save(modelData: [T]){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(modelData)
            try data.write(to: fileInfo.url)
        }catch{
            
        }
    }
}
