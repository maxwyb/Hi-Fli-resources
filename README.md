## Hi-Fli Resources
Codes and resources for Cal Hacks 3.0 project - **Hi-Fli**: a drone data transmitter, where people no longer have to worry about spotty Wi-Fi access.  

[Link on Devpost](https://devpost.com/software/hi-flier)

### Codes
`Intel-edison-central`: Intel Edison backend code as a Bluetooth LE central, implemented by Node.js. Receiving data.   
`Bluetooth-peripheral-iOS`: iOS frontend as a Bluetooth LE peripheral, using wrapper library `BluetoothKit`. Transfering data.   
`Core-Bluetooth-Transfer-Demo`: iOS BLE peripheral lower-level implementation of directly using Core Bluetooth framework.  
`iBeacon-detection`: iOS app to detect Intel Edison board as a BLE iBeacon peripheral. Run `bleno/test-ibeacon.js` in Edison to enter iBeacon broadcasting mode.  
`Google-Stock-API`: Swift JSON parsing miscellaneous using Alamofire.  

### Frameworks
`bleno` and `noble` on Github.  
