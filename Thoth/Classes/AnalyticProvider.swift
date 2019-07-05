//
//  AnalyticProvider.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public protocol AnalyticProvider {
    func post(event: AnalyticEvent)
}
