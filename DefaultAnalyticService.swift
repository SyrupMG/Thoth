//
//  DefaultAnalyticService.swift
//  Thoth
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public class DefaultAnalyticService: AnalyticService {
    
    public init() {}
    
    var providers = [AnalyticProvider]()
    
    public func register(provider: AnalyticProvider) {
        providers.append(provider)
    }
    
    public func post(event: AnalyticEvent) {
        providers.forEach { provider in
            provider.post(event: event)
        }
    }
    
    public func bootstrap() {
    
    }
    
    
}
