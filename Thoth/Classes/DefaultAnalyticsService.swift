//
//  DefaultAnalyticsService.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 29/11/2018.
//

import Foundation

public class DefaultAnalyticsService: AnalyticsService {
    
    public let shared = DefaultAnalyticsService()
    
    public init(){}
    
    public func configure() {
        providers.forEach{$0.configure()}
    }
    
    public var providers: [AnalyticsService] = [FirebaseAnalyticsProvider()]
    
    public func register(providers: AnalyticsService...){
        self.providers.append(contentsOf: providers)
    }
    
    public func log(_ event: AnalyticsEvent) {
        providers.forEach{$0.log(event)}
    }
    
    public func startMeasuringDuration(of event: AnalyticsEvent) -> () -> Void { return {} }
    public func log(_ playedInterval: Interval, of content: AnalyticsPlayableContent) {}
}



