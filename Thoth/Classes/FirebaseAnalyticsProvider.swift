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
import FirebasePerformance

@objc public class FirebaseAnalyticsProvider: NSObject, AnalyticsServiceProvider, MeasuringAnalyticsServiceProvider {
    @objc public func configure(){
        FirebaseApp.configure()
    }
    
    @objc public func log(_ event: AnalyticsEvent) {
        Analytics.logEvent(event.name, parameters: event.parameters)
    }
    
    @objc public func startMeasuringDuration(forTag tag: String) -> (AnalyticsEvent) -> Void {
        let trace = Performance.startTrace(name: tag)
        return { event in
            event.parameters?.forEach { param in
                trace?.setValue(param.value, forKey: param.key)
            }
            trace?.stop()
        }
    }
}
