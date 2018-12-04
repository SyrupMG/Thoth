//
//  ThothServiceLocator.swift
//  Thoth
//
//  Created by Лысенко Алексей Димитриевич on 04/12/2018.
//

import Foundation

public func defaultService() -> AnalyticsService {
    return DefaultAnalyticsService.shared
}

@objc public class ThothServiceLocator: NSObject {
    @objc public static func `default`() -> AnalyticsService {
        return defaultService()
    }
}
