//
//  TabInCatalogClick.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct TabInCatalogClick: AppmetricaEvent {
    public let trackId: String? = nil
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    
    public var name: String { return tabName.rawValue }
    let tabName: Tab
    enum Tab: String {
        case series
        case films
        case show
    }
    
    public let block: String = "menu"
    public let screen: String = "catalog"
}
