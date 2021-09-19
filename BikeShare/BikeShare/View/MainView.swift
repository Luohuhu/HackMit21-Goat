//
//  MainView.swift
//  BikeShare
//
//  Created by 罗贤甫 on 9/18/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct MainView: View {
    @State var destination: String
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0942), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    let stations = [
        BikeStation(name: "British Museum", free_bike: 10, latitude: 42.3679, longitude: -71.0983),
        BikeStation(name: "Tower of London", free_bike: 11, latitude: 42.3608, longitude: -71.0912),
        BikeStation(name: "Big Ben", free_bike: 5, latitude: 42.3696, longitude: -71.0968)
        ]
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region)
                .frame(width: screenWidth, height: screenHeight + 10)
            Map(coordinateRegion: $region, annotationItems: stations) { station in
                        // Insert an annotation type here
                MapMarker(coordinate: station.coordinate)
                    }
            VStack{
                SearchBar(text: $destination)
            }.padding(.top, -screenHeight/2 + 30)
        }
        
    }
}
// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
 
struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(destination: "")
    }
}
