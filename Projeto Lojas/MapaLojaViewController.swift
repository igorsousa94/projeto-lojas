//
//  MapaLojaViewController.swift
//  Projeto Lojas
//
//  Created by Lidnaldo on 06/10/21.
//

import UIKit
import CoreLocation
import MapKit

class MapaLojaViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        locationManager.delegate = self
        
//        locationManager.requestWhenInUseAuthorization()
        
        if #available(iOS 14.0, *) {
            if locationManager.authorizationStatus == CLAuthorizationStatus.notDetermined {
                locationManager.requestWhenInUseAuthorization()
                print("Não determinado")
            } else if locationManager.authorizationStatus == CLAuthorizationStatus.restricted {
                print("Restrito")
            }
            locationManager.startUpdatingLocation()
        } else {
                // Fallback
        }
        
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 3
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        print("mudei de localizacao \(locations.count)")


        let span = MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
        let centro = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: centro, span: span)
        mapView.setRegion(region, animated: true)

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarkList, erro in
            guard let placemark = placemarkList?.first else { return }
            print(placemark.areasOfInterest)
        }
    }


}
