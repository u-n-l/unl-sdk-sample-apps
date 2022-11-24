//
//  ViewController.swift
//  SampleApp
//
//  Created by Gurwinder Singh on 02/11/22.
//

import UIKit

// Import UNLMapSDK to use it for configuring the map
import UNLMapSDK

class ViewController: UIViewController {
    
    /// Asign UNLMapView class to UIView in storyboard
    /// Create outlet of UIMapView in View Controller
    @IBOutlet var mapView: UNLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Do any additional setup after loading the view.

        /// gridOptions are optional, It use default values if not configured
        /// By default it use GEOHASH_LENGTH_9
        /// By default grid line color is lightGray
        /// By default grid line width is 0.5
        self.mapView.gridOptions = GridControlOptions(.GEOHASH_LENGTH_9, .red, 0.5)
        
        /// arrayTiles is optional in case using inbuild tile selector
        /// By default it will show all available tiles
        self.mapView.arrayTiles = [.base, .satellite, .terrain, .traffic]
        
        /// Load map after setting properties
        mapView.loadMap()
    }

    @IBAction func actionMapStyles(_ sender: UISegmentedControl) {
        /// In case not using inbuilt tile selector
        /// Use changeTile to change style of map
        mapView.changeTile(style: .terrain)
    }
}

