//
//  PassRestore.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import Thoth

public struct PassRestoreEvent: AppmetricaEvent {
    public let trackId: String? = nil
    
    public let eventValue: String? = nil
    
    public let params: Dictionary<String, String> = [:]
    
    public let name: String = "pass_restore"
    
    public let block: String = "default"
    public let screen: String = "authorisation"
}
