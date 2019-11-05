//
//  AppsFlyerAnalyticProvider.swift
//  Pods
//
//  Created by Иван Бабич on 26/09/2019.
//

import Foundation
import AppsFlyerLib

public protocol AppsFlyerEvent: AnalyticEvent {}

public class AppsFlyerAnalyticProvider: AnalyticProvider {
    private(set) var appmetricaDeviceId: String? = nil

    public init(apiKey: String, appleId: String) {
        AppsFlyerTracker.shared().appsFlyerDevKey = apiKey
        AppsFlyerTracker.shared().appleAppID = appleId
    }

    public func bootstrap() {}

    /** Отправка события.
     */
    public func post(event: AnalyticEvent) {
        guard let event = event as? AppsFlyerEvent else { return }

        AppsFlyerTracker.shared()?.trackEvent(event.name, withValues: event.params)
    }
}
