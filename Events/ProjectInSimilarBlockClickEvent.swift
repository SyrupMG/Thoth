//
//  ProjectInSimilarBlockClickEvent.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct ProjectInSimilarBlockClickEvent: AppmetricaEvent {
    public let trackId: String?
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "project"
    
    public let block: String = "similar"
    public let screen: String = "project"
}
