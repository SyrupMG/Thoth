//
//  AppmetricaAnalyticProvider..swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import YandexMobileMetrica

public protocol AppmetricaEvent: AnalyticEvent { }

public class AppmetricaAnalyticProvider: AnalyticProvider {
    public init(apiKey: String) {
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: apiKey)
        YMMYandexMetrica.activate(with: configuration!)
    }

    public func bootstrap() {

    }

    public func post(event: AnalyticEvent) {
        guard let event = event as? AppmetricaEvent else { return }
        
        YMMYandexMetrica.reportEvent(event.name, parameters: event.params)
    }
}

