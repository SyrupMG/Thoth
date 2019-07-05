//
//  SubInitiateEvent.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation
import Thoth

public struct LoginEven: AppmetricaEvent {
    public let trackId: String? = nil
    
    public let eventValue: String? = nil
    
    public let params: [String : String] = [:]
    
    public let name: String = "sub_initiate"
    
    public let block: String = "default"
    public let screen: String
}
