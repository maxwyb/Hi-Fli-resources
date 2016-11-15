//
//  ViewController.swift
//  Google-Stock-API
//
//  Created by Yingbo Wang on 11/13/16.
//  Copyright © 2016 Yingbo Wang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let stockName = "AAPL"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getStockData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getStockData() {
        var stockWebsite = "http://dev.markitondemand.com/MODApis/Api/v2/Quote/jsonp?symbol=" + stockName + "&callback=stock"
        
        //let testWebsite = "https://api.github.com/users/mralexgray/repos"
        //let googleWebsite = "https://www.google.com/finance/info?q=NSE:AAPL"
        let amadeusWebsite = "https://api.sandbox.amadeus.com/v1.2/hotels/search-airport?apikey=0i9UfGFPO3tgGfoHQ8OSk1TuKRUOrsZp&location=LAX&check_in=2016-11-15&check_out=2016-11-16"
        
        Alamofire.request(amadeusWebsite).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
            //debugPrint(response.result.value)
            
            // Amadeus API results parsing
            var property_names = [String]()
            
            let responseDic = response.result.value as! NSDictionary
            let responseDicArr = responseDic.value(forKey: "results") as! NSArray
            //debugPrint(responseDicArr)
            for responseDicArr_elm in responseDicArr {
                let responseDicArr_elmDic = responseDicArr_elm as! NSDictionary
                let res = responseDicArr_elmDic.value(forKey: "property_name") as! String
                
                property_names.append(res)
                debugPrint(res)
            }
            
            //let responseDicArr_elm = responseDicArr[0]

//            for element in responseDicArr as! NSDictionary {
//                if element == "property_name" {
//                    
//                }
//            }
        }
    }


}

