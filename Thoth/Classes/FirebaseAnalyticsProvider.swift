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

public class FirebaseAnalyticsProvider: AnalyticsServiceProvider {
    public init(){}
    
    public func configure(){
        FirebaseApp.configure()
    }
    
    public func log(_ event: AnalyticsEvent) {
        Analytics.logEvent(event.name, parameters: event.parameters)
    }
}
