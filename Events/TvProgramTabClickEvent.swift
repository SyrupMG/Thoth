//
//  TvProgramTabClickEvent.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct TvProgramTabClickEvent: AppmetricaEvent {
    public let trackId: String? = nil
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "tv_program"
    
    public let block: String = "default"
    public let screen: String = "tv"
}
