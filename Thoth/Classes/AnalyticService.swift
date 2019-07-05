//
//  AnalyticService.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public protocol AnalyticService {
    func register(provider: AnalyticProvider)
    func post(event: AnalyticEvent)
    func bootstrap()
}
