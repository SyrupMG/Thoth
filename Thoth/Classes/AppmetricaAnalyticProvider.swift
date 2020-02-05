//
//  AppmetricaAnalyticProvider..swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public protocol AppmetricaEvent: AnalyticEvent { }

#if os(iOS)
import YandexMobileMetrica

public class AppmetricaAnalyticProvider: AnalyticProvider {
    public var deviceIdChangeCallback: ((String?) -> ())? = nil
    
    public init(apiKey: String) {
        let configuration = YMMYandexMetricaConfiguration.init(apiKey: apiKey)
        YMMYandexMetrica.activate(with: configuration!)
    }

    public func bootstrap() {
        YMMYandexMetrica.requestAppMetricaDeviceID(withCompletionQueue: DispatchQueue.global(qos: .default)) { deviceId, error in
            guard error == nil else { return }
            self.requestAppmetricaDeviceId()
        }
    }

    public func post(event: AnalyticEvent) {
        guard let event = event as? AppmetricaEvent else { return }
        
        YMMYandexMetrica.reportEvent(event.name, parameters: event.params)
    }
    
    private func requestAppmetricaDeviceId() {
        YMMYandexMetrica.requestAppMetricaDeviceID(withCompletionQueue: DispatchQueue.global(qos: .default)) { deviceId, error in
            guard error == nil else { self.deviceIdChangeCallback?(nil); return }
            self.deviceIdChangeCallback?(deviceId)
        }
    }
}
#endif

