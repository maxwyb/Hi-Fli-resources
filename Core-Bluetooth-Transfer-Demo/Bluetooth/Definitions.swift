//
//  Definitions.swift
//  Bluetooth
//
//  Created by Mick on 12/20/14.
//  Copyright (c) 2014 MacCDevTeam LLC. All rights reserved.
//

import CoreBluetooth

let TRANSFER_SERVICE_UUID = "BED00F53-489D-4DED-A907-8DEA6601B6B8"
let TRANSFER_CHARACTERISTIC_UUID = "24960871-6C22-454D-BD62-94DD70B6E318"
let NOTIFY_MTU = 20

let transferServiceUUID = CBUUID(string: TRANSFER_SERVICE_UUID)
let transferCharacteristicUUID = CBUUID(string: TRANSFER_CHARACTERISTIC_UUID)
