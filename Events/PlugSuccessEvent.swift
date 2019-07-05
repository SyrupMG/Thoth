//
//  PlugSuccess.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct PlugSuccessEvent: AppmetricaEvent {
    public let trackId: String? = nil
    
    /// Device type
    public let eventValue: String?
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "plug_success"
    
    public let block: String = "default"
    public let screen: String = "profile"
}
