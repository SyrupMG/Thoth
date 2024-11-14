//
//  DefaultAnalyticService.swift
//  Thoth
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public class DefaultAnalyticService: AnalyticService {
    public var appmetricaDeviceId: String?

    public init() {}

    private var providers = [AnalyticProvider]()
    
    public func register(provider: AnalyticProvider) {
        providers.append(provider)
    }
    
    public func post(event: AnalyticEvent) {
        providers.forEach { $0.post(event: event) }
    }
    
    public func bootstrap() {
        providers.forEach { $0.bootstrap() }
    }

}
