//
//  AppmetricaAnalyticProvider..swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import YandexMobileMetrica

public class AppmetricaAnalyticProvider: AnalyticProvider {
    
    var userId: String?
    var sid: String?
    
    public func post(event: AnalyticEvent) {
        guard let e = event as? AppmetricaEvent else {
            return
        }
        
        var params: [String: String] = [
            "screen": e.screen,
            "block": e.block
        ]
        params["tz"] = String(Float(TimeZone.current.secondsFromGMT()) / 3600.0)
        
        if let realSid = sid {
            params["sid"] = realSid
        }
        if let user = userId {
            params["user_id"] = user
        }
        if let track = e.trackId {
            params["track_id"] = track
        }
        if let eventValue = e.eventValue {
            params["event_value"] = eventValue
        }
        
        params = e.params.merging(params) { $1 }
        
        YMMYandexMetrica.reportEvent(e.name, parameters: params)
    }
    
    
    
    public init(apiKey: String) {
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: apiKey)
        YMMYandexMetrica.activate(with: configuration!)
    }
}

public protocol AppmetricaEvent: AnalyticEvent {
    var screen: String { get }
    var block: String { get }
    var trackId: String? { get }
    var projectId: String? { get }
    var eventValue: String? { get }
}
