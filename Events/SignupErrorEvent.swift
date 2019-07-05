//
//  ErrorEvent.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct SignupErrorEvent: AppmetricaEvent {
    public let trackId: String? = nil
    
    ///Error type
    public let eventValue: String?
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "error"
    
    public let block: String = "default"
    public let screen: String = "signup"
}
