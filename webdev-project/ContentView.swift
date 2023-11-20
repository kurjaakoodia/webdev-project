//
//  ContentView.swift
//  webdev-project
//
//  Created by Atte Kilpeläinen on 14.11.2023.
//

// esimerkki-kartta näkyissä

import SwiftUI
import MapKit

struct ContentView: View {
   @StateObject private var mapAPI = MapAPI()
   @State private var text = ""
   
   var body: some View {
      VStack {
         TextField("Enter an address", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
         
         Button("search for a place") {
            mapAPI.getLocation(address: text, delta: 0.5)
         }
         
          GeometryReader { geometry in
              Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) { location in
                  MapMarker(coordinate: location.coordinate, tint: .blue)
              }
              .frame(height: geometry.size.height / 2)
              .ignoresSafeArea()
          }
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
