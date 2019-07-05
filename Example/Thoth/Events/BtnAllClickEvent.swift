//
//  BtnAllClickEvent.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct BtnAllClickEvent: AppmetricaEvent {
    public let trackId: String? = nil
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "all"
    
    ///continue_watching; live; %название подборки%
    public let block: String
    public let screen: String = "main"
}
