// MapView.swift
// (c) Alex Fila 26/02/25

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.8365395, longitude: 14.30615),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        ZStack {
            DynamicMesh()
            GeometryReader { geometry in
                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                        .edgesIgnoringSafeArea(.all)
                }
                .onAppear { locationManager.requestLocation() }
                .onChange(of: locationManager.location) { newLocation in
                    if let location = newLocation {
                        region = MKCoordinateRegion(
                            center: location.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height/1.1)
            }
        }
    }
}

#Preview { MapView() }
