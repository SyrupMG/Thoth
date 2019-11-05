//
//  AnalyticService.swift
//  Alamofire
//
//  Created by Anton Sobolev on 04/07/2019.
//

import Foundation

public protocol AnalyticService {
    // TODO: - Не понял прикола, нахрен он тут нужен, если он нигде не выставляется.
//    var appmetricaDeviceId: String? { get }

    func register(provider: AnalyticProvider)
    func post(event: AnalyticEvent)
    func bootstrap()
}
