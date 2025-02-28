// MapView.swift
// (c) Alex Fila 26/02/25

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.8365395, longitude: 14.30615),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    private let distanceOptions = [1.0, 3.0, 5.0]
    @State private var selectedDistanceIndex = 1 // Default to 3km
    
    var body: some View {
        ZStack {
            DynamicMesh()
            ZStack {
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .preferredColorScheme(.dark)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    LinearGradient(
                        gradient: Gradient(
                            stops: [
                                .init(color: .clear, location: 0),
                                .init(color: .black, location: 1)
                            ]
                        ),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .ignoresSafeArea(.all)
                    .frame(height: 100)
                    .opacity(0.9)
                    .blendMode(.destinationOut)
                    
                    Spacer()
                    
                    LinearGradient(
                        gradient: Gradient(
                            stops: [
                                .init(color: .clear, location: 0),
                                .init(color: .black, location: 1)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea(.all)
                    .frame(height: 100)
                    .opacity(0.9)
                    .blendMode(.destinationOut)
                }
                
                VStack {
                    Spacer()
                    distancePicker
                        .padding(.bottom, 40) // Adjust based on safe area
                }
            }
            .onAppear { locationManager.requestLocation() }
            .onChange(of: locationManager.location) { newLocation in
                if let location = newLocation {
                    region = MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                }
            }
            .onChange(of: selectedDistanceIndex) { newIndex in
                updateMapRegion(distance: distanceOptions[newIndex])
            }
            .compositingGroup()
        }
    }
    
    private var distancePicker: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.5))
                .frame(height: 50)
                .frame(maxWidth: 300)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<distanceOptions.count, id: \.self) { index in
                        Button(action: {
                            selectedDistanceIndex = index
                        }) {
                            Text("\(Int(distanceOptions[index]))km")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(selectedDistanceIndex == index ? .white : .gray)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(
                                    selectedDistanceIndex == index ?
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.black.opacity(0.5)) :
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.clear)
                                )
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .frame(height: 50)
            .frame(maxWidth: 300)
        }
    }
    
    private func updateMapRegion(distance: Double) {
        let latDelta = distance / 111.0
        let lonDelta = latDelta / cos(region.center.latitude * .pi / 180.0)
        
        withAnimation {
            region.span = MKCoordinateSpan(
                latitudeDelta: latDelta,
                longitudeDelta: lonDelta
            )
        }
    }
}

#Preview { MapView() }
