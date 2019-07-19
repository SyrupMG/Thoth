//
//  AppmetricaAnalyticProvider..swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import YandexMobileMetrica

public class AppmetricaAnalyticProvider: AnalyticProvider {
    
    public func post(event: AnalyticEvent) {
        guard let e = event as? AppmetricaEvent else {
            return
        }
        
        YMMYandexMetrica.reportEvent(e.name, parameters: e.params)
    }
    
    
    
    public init(apiKey: String) {
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: apiKey)
        YMMYandexMetrica.activate(with: configuration!)
    }
}

public protocol AppmetricaEvent: AnalyticEvent {
}
