//
//  FirebaseAnalyticsProvider.swift
//  Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 30/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseAnalytics

public class FirebaseAnalyticsProvider: AnalyticsService {
    
    public init(){}
    
    public func configure(){
        FirebaseApp.configure()
    }
    
    public func log(_ event: AnalyticsEvent) {
        Analytics.logEvent(event.name, parameters: event.parameters)
    }
    
    public func startMeasuringDuration(of event: AnalyticsEvent) -> () -> Void {
        return {}
    }
    
    public func log(_ playedInterval: Interval, of content: AnalyticsPlayableContent) {
        
    }
    
    
    
}
