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

fileprivate class DummyContent: AnalyticsPlayableContent {
    var uniqueName: String = "GOGI"
    var totalLength: TimeInterval = 120
}

fileprivate class CoolDelegate: AnalyticServiceDelegate {
    func contentProgressChanged(_ content: AnalyticsPlayableContent, progress: Double) {
        print("!!! HELLO !!! Progress changed:", content.uniqueName, progress)
    }
}

class Screen1ViewController: UIViewController {
    private let analyticsService: AnalyticsService = Thoth.defaultService()
    
    private let dummy = DummyContent()
    private let delegate = CoolDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        networkRequest()
//        analyticsService.clearPlayedProgress(of: dummy)
        logSomeContentPregress()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func logSomeContentPregress() {
        analyticsService.delegate = delegate
        analyticsService.log(0...1, of: self.dummy)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.analyticsService.log(1...3, of: self.dummy)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.analyticsService.log(3...5, of: self.dummy)
            }
        }
    }
    
    private func networkRequest(){
        
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

