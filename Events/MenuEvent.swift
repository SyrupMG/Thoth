//
//  MenuEvent.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import Thoth

public struct MenuEvent: AppmetricaEvent {
    public let trackId: String? = nil
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    
    public var name: String { return pageName.rawValue }
    let pageName: Page
    enum Page: String {
        case main
        case catalog
        case tv
        case profile
    }
    
    public let block: String = "menu"
    public let screen: String
}
