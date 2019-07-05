//
//  TvProgramChannelClickEvent.swift
//  Thoth_Example
//
//  Created by Anton Sobolev on 04/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Thoth

public struct TvProgramTabChannelClickEvent: AppmetricaEvent {
    public let trackId: String?
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    ///Channel
    public let name: String
    
    public let block: String = "tv_program"
    public let screen: String = "tv"
}
