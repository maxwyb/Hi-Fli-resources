var noble = require('../..');

var transferUuid = '13333333333333333333333333333337';

var transferLocationUuid = '13333333333333333333333333330001';
var transferMsgUuid = '13333333333333333333333333330002';

var transferLocation = null;
var transferMsg = null;

noble.on('stateChange', function(state) {
    if (state === 'poweredOn') {
	console.log('Intel Edison central scanning...');
	noble.startScanning([pizzaServiceUuid], false);
    } else {
	noble.stopScanning();
    }
})

noble.on('discover', function(peripheral) {

    noble.stopScanning();
    console.log("Found peripheral: ", peripheral.advertisement);

    peripheral.connect(function(err) {

	peripheral.discoverServices([transferUuid], function(err, services) {
	    services.forEach(function(service) {

		console.log('-Found service: ', service.uuid);

		service.discoverCharacteristics([], function(err, characteristics) {
		    characteristics.forEach(function(characteristic) {

			console.log('--Found characteristic: ', characteristic.uuid);

			if (transferLocationUuid == characteristic.uuid) {
			    transferLocation = characteristic;
			} else if (transferMsgUuid == characteristic.uuid) {
			    transferMsg = characteristic;
			}
			
		    })
		})
	    })
	})
    })
}

