//
//  AnalyticEvent.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation



public protocol AnalyticEvent {
    
    var name: String {get}
    var params: [String: Any?] {get}
}

extension AnalyticEvent {
    var params: [String: Any?] { return [:] }
}
