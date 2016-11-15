//
//  ViewController.swift
//  Bluetooth-peripheral-iOS
//
//  Created by Yingbo Wang on 11/12/16.
//  Copyright © 2016 Yingbo Wang. All rights reserved.
//

import UIKit
import BluetoothKit

class ViewController: UIViewController, BKPeripheralDelegate {

 
    let peripheral = BKPeripheral()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        peripheral.delegate = self
        
        bleInitialize()
        bleSendMsg()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bleInitialize() {

        do {
            let serviceUUID = NSUUID(uuidString: "BED00F53-489D-4DED-A907-8DEA6601B6B8")!  // transfer UUID
            let characteristicUUID = NSUUID(uuidString: "24960871-6C22-454D-BD62-94DD70B6E318")!  // characteristic UUID
            let localName = "max-iPhone"
            let configuration = BKPeripheralConfiguration(dataServiceUUID: serviceUUID as UUID, dataServiceCharacteristicUUID:  characteristicUUID as UUID, localName: localName)
            
            try peripheral.startWithConfiguration(configuration)
            
            print("peripheral startWithConfiguration() done.")
            
        } catch let error {
            print(error)
        }
        
    }
    
    func bleSendMsg() {
        
        let data = "42".data(using: String.Encoding.utf8)
        print(peripheral.connectedRemoteCentrals.count)
        for remoteCentral in peripheral.connectedRemoteCentrals {
            peripheral.sendData(data!, toRemotePeer: remoteCentral) { data, remoteCentral, error in
                guard error == nil else {
                    print(error.debugDescription)
                    return
                print("bleSendMsg() done.")
                }
            }
        }
        
    }
    
    func peripheral(_ peripheral: BKPeripheral, remoteCentralDidConnect remoteCentral: BKRemoteCentral) {
        
        print("iOS peripheral connected.")

    }
    
    func peripheral(_ peripheral: BKPeripheral, remoteCentralDidDisconnect remoteCentral: BKRemoteCentral) {
        print("iOS peripheral disconnected.")

    }

}

