//
//  MapView.swift
//  FinalProject
//
//  Created by Hertzog, Kenton Brandt on 4/13/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var gameManager : GameManager
    var showAll : Bool
    var body: some View {
        if showAll{
            Map(coordinateRegion: $gameManager.region,interactionModes: .all, annotationItems: gameManager.gameModel.countriesList, annotationContent: markerFor(country:))
                .ignoresSafeArea()
        }else{
            Map(coordinateRegion: $gameManager.region,interactionModes: .all, annotationItems: gameManager.countriesToShow, annotationContent: markerFor(country:))
                .ignoresSafeArea()
        }
    }
    
}

extension MapView{
    func markerFor(country : Country) -> some MapAnnotationProtocol{
        MapMarker(coordinate: CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude), tint: .red)
    }
}
