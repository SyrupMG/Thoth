//
//  AnalyticsService.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 26/11/2018.
//

import Foundation

public typealias Interval = (startTime: Double, endTime: Double)

public protocol AnalyticsEvent {
    
    var name: String { get }
    var parameters: [String:Any]? { get }
}

public protocol AnalyticsPlayableContent {
    
    var uniqueName: String { get }
    var totalLength: Double { get }
}

public protocol AnalyticsService {
    
    func log(_ event: AnalyticsEvent)
    func startMeasuringDuration(of event: AnalyticsEvent) -> () -> Void
    func log(_ playedInterval: Interval, of content: AnalyticsPlayableContent) -> Void
}



