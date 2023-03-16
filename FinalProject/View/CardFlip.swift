//
//  CardFlip.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/11/22.
//

import SwiftUI

struct CardFlip: View {
    enum DraggingState{
        case right, left
    }
    var word : Word
    @State private var degrees : Double = 0.0
    @State private var swipeDirection = DraggingState.left
    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0
    
    var isShowingBack : Bool{degrees < midDegrees}
    var textToShow : String {isShowingBack ? word.translation : word.word}
    var backgroundColor : Color {isShowingBack ? ViewConstants.appBlue : ViewConstants.appGreen}
    var flipDegree : Double {isShowingBack ? backDegrees : frontDegrees}
    var body: some View {
        let swipe = DragGesture()
            .onChanged{ v in
                let translation = Double(v.translation.width)
                switch swipeDirection {
                case .right:
                    degrees = rotationDegreesFor(translation+backDegrees)
                case .left:
                    degrees = rotationDegreesFor(translation)
                }
            }
            .onEnded{v in
                if isShowingBack{
                    swipeDirection = .right
                    degrees = backDegrees
                } else {
                    swipeDirection = .left
                    degrees = frontDegrees
                }
            }
        return CardView(tts: textToShow, displayColor: backgroundColor)
        .rotation3DEffect(Angle(degrees: flipDegree), axis: (0,1,0))
        .rotation3DEffect(Angle(degrees: degrees), axis: (0,1,0))
        
        .gesture(swipe)
    }
    func rotationDegreesFor(_ translation: Double) -> Double {
            if translation > frontDegrees {
                return  frontDegrees
            } else if translation < backDegrees {
                return  backDegrees
            } else {
                return translation
            }
        }
}
