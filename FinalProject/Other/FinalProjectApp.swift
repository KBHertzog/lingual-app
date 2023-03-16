//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/6/22.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    @StateObject var gameManager = GameManager()
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)
        }
        .onChange(of: scenePhase){phase in
            switch phase{
            case .background,.inactive:
                gameManager.gameModel.storageManager.save(modelData: gameManager.gameModel.languageList)
                break
            default:
                break
            }
        }
    }
}
