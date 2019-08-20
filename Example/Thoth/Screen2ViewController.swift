//
//  Screen2ViewController.swift
//  Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 30/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Thoth

class Screen2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = DefaultAnalyticService()
        service.register(provider: AppmetricaAnalyticProvider(apiKey: "a5e0844d-a89b-4966-b58d-c541ed34e95c"))
        
        service.bootstrap()
        let item = LoginEvent.init()
        service.post(event: item)

    }
}
