//
//  FirebaseAnalyticProvider.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public protocol FirebaseEvent: AnalyticEvent {}

#if os(iOS)
import FirebaseAnalytics
import FirebaseCore
import FirebasePerformance

public class FirebaseAnalyticProvider: AnalyticProvider {
    
    public func post(event: AnalyticEvent) {
        guard let event = event as? FirebaseEvent else { return }
        Analytics.logEvent(event.name, parameters: event.params)
    }
    
    init() {
        FirebaseApp.configure()
    }

    public func bootstrap() {

    }
}
#endif
