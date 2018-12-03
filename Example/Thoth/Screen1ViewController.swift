//
//  Screen1ViewController.swift
//  Thoth
//
//  Created by tm on 11/26/2018.
//  Copyright (c) 2018 tm. All rights reserved.
//

import UIKit
import Thoth
import Alamofire

class Screen1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkRequest()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func networkRequest(){
        
        let urlString = "https://videomore.ru/api/tracks.json?app_id=videomore_&track_id=260088&sig=04d450387a2ba85e7c43acb030fb309d"
      
        
        Alamofire.request(urlString).responseString {
            
            //var event = NetworkEvent(url: urlString, executionTime: )
            
            
            do {
                
                let jsonString = try $0.result.unwrap()
                
                /*
                let json = try JSON.decode(jsonString)
                guard let firstModel = json.array?.first else { throw Error.general }
                var decoder = JSON.Decoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let track = try decoder.decode(Track.self, from: firstModel)
                
                if let assetUrl = try? track.hls.asURL() {
                    self.currentAsset = AVURLAsset(url: assetUrl)
                }
                
                try adController.initialize(firstModel)
 */
            } catch {
                print("Got an Error while working with JSON", error)
            }
        }
    }

}

