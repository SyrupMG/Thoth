//
//  FirebaseAnalyticProvider.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import FirebaseCore
import FirebaseAnalytics
import FirebasePerformance

public class FirebaseAnalyticProvider: AnalyticProvider {
    
    public func post(event: AnalyticEvent) {
        guard let e = event as? FirebaseEvent else {
            return
        }
        Analytics.logEvent(event.name, parameters: e.params)
    }
    
    
    init() {
        FirebaseApp.configure()
    }
}

public protocol FirebaseEvent: AnalyticEvent {}
