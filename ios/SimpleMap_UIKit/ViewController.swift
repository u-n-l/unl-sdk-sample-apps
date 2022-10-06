//
//  ViewController.swift
//  SimpleMap_UIKit
//
//  Created by Gurwinder Singh on 28/09/22.
//

import UIKit
import UNLMapSDK
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet var mapView: UNLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.loadMap(centre: CLLocationCoordinate2D(latitude: 40.729437724412420, longitude: -74.00527954101562))
        mapView.showTiles(withArray: ["Base","Satellite", "Terrain", "Traffic", "Vectorial"], show: true)
    }
    
//    @IBAction func actionMapStyles(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 1:
//            mapView.changeTile(style: .terrain)
//        case 2:
//            mapView.changeTile(style: .traffic)
//        case 3:
//            mapView.changeTile(style: .satellite)
//        case 4:
//            mapView.changeTile(style: .vectorical)
//        default:
//            mapView.changeTile(style: .base)
//        }
//    }
}
