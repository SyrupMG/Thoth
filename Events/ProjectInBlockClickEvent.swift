//
//  ProjectInBlockClickEvent.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct ProjectInBlockClickEvent: AppmetricaEvent {
    public let trackId: String?
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "project"
    
    ///название подборки
    public let block: String
    public let screen: String = "catalog"
}
