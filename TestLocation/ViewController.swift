//
//  ViewController.swift
//  TestLocation
//
//  Created by Cahyanto Setya Budi on 4/11/19.
//  Copyright © 2019 ChatAja. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calculatePosition()
    }
    
    private func calculatePosition() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if authorizationStatus == .authorizedWhenInUse {
            locationManager?.startUpdatingLocation()
        } else {
            locationManager?.requestWhenInUseAuthorization()
            calculatePosition()
        }
    }
}

