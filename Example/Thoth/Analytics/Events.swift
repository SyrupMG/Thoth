//
//  Events.swift
//  Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 30/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

enum EventName: String {
    case network
}

class NetworkEvent: AnalyticsEvent {
    
    let name = EventName.network.rawValue
    
    var url: String
    var executionTime: Double
    var error: String
    
    var parameters: [String : Any]? {
        
        return [
            "url": self.url,
            "executionTime": self.executionTime,
            "error": self.error
        ]
    }
    
    init(url: String, executionTime: Double = 0.0, error: String = "") {
        self.url = url
        self.executionTime = executionTime
        self.error = error
    }
}
