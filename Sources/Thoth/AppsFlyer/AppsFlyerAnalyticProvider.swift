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
    public init(apiKey: String, appleId: String) {
        AppsFlyerLib.shared().appsFlyerDevKey = apiKey
        AppsFlyerLib.shared().appleAppID = appleId
    }

    public func bootstrap() {}

    /** Отправка события */
    public func post(event: AnalyticEvent) {
        guard let event = event as? AppsFlyerEvent else { return }
        AppsFlyerLib.shared().logEvent(name: event.name, values: event.params)
    }
    
    public func setCustomerUserId(_ customerUserID: String?) {
        AppsFlyerLib.shared().customerUserID = customerUserID
    }
}
