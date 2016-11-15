//
//  ViewController.swift
//  iBeacon-detection
//
//  Created by Yingbo Wang on 11/12/16.
//  Copyright © 2016 Yingbo Wang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var beaconLabel: UILabel?
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // location service initialization for iBeacon
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        print("Initialization done.")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startBeaconScanning()
                }
            }
        }
    }
    
    func startBeaconScanning() {
        
        print("Start iBeacon scanning...")
        
        let uuid = UUID(uuidString: "643479D7-DFEE-49BE-97E7-BB65AA9478CD")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 0, minor: 0, identifier: "EdisonBeacon")
        
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
        
    }
    
    // when iBeacon distance data get updated
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
        } else {
            updateDistance(.unknown)
        }
    }
    
    func updateDistance(_ distance: CLProximity) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .unknown:
                self.view.backgroundColor = UIColor.gray
                self.beaconLabel?.text = "unknown"
                
            case .far:  // far away
                self.view.backgroundColor = UIColor.blue
                self.beaconLabel?.text = "far"
                
            case .near:  // close
                self.view.backgroundColor = UIColor.orange
                self.beaconLabel?.text = "near"
                
            case .immediate:  // closest
                self.view.backgroundColor = UIColor.red
                self.beaconLabel?.text = "immediate"
                
            }
        }
    }

}

