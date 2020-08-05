//
//  AppmetricaAnalyticProvider..swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public protocol UserXEvent: AnalyticEvent { }

#if os(iOS)
import UserXKit
public class UserXAnalyticProvider: AnalyticProvider {
    
    public init() {
    }
    
    public func post(event: AnalyticEvent) {
        guard let event = event as? UserXEvent else { return }
        UserX.addEvent(event.name, with: event.params)
    }

    public func bootstrap() {
    }
}
#endif

