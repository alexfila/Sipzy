// LocationManager.swift
// (c) Alex Fila 27/02/25

import SwiftUI
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var location: CLLocation?
    @Published var clubLocations: [ClubLocation] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        geocodeClubs()
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        // Uncomment to stop continuous updates after getting initial location
        // locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
    
    private func geocodeClubs() {
        for club in clubs {
            geocoder.geocodeAddressString(club.address) { [weak self] placemarks, error in
                if let coordinate = placemarks?.first?.location?.coordinate {
                    DispatchQueue.main.async {
                        self?.clubLocations.append(ClubLocation(name: club.name, coordinate: coordinate))
                    }
                }
            }
        }
    }
}

struct ClubLocation: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
