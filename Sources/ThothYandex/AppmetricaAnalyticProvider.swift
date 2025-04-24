//
//  AppmetricaAnalyticProvider..swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import ThothCore
import AppMetricaCore

public protocol AppmetricaEvent: AnalyticEvent { }

public class AppmetricaAnalyticProvider: AnalyticProvider {
    public var deviceIdChangeCallback: ((String?) -> ())? = nil
    
    public init(apiKey: String) {
        let configuration = AppMetricaConfiguration(apiKey: apiKey)
        AppMetrica.activate(with: configuration!)
    }

    public func bootstrap() {
        AppMetrica.requestStartupIdentifiers(
            for: [.deviceIDHashKey],
            on: .global(qos: .default)
        ) { deviceId, error in
            guard error == nil else { return }
            self.requestAppmetricaDeviceId()
        }
    }

    public func post(event: AnalyticEvent) {
        guard let event = event as? AppmetricaEvent else { return }
        AppMetrica.reportEvent(name: event.name, parameters: event.params)
    }
    
    private func requestAppmetricaDeviceId() {
        AppMetrica.requestStartupIdentifiers(
            for: [.deviceIDHashKey],
            on: .global(qos: .default)
        ) { result, error in
            guard error == nil else { self.deviceIdChangeCallback?(nil); return }
            if let deviceID = result?[StartupKey.deviceIDHashKey] as? String {
                self.deviceIdChangeCallback?(deviceID)
            }
        }
    }
}

