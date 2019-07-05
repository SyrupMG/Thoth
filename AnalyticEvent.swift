//
//  AnalyticEvent.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation



public protocol AnalyticEvent {
    
    var name: String {get}
    var params: [String: String] {get}
}

extension AnalyticEvent {
    var params: [String: String] { return [:] }
}
