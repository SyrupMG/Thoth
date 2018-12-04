//
//  TimeInterval.swift
//  Thoth
//
//  Created by Лысенко Алексей Димитриевич on 04/12/2018.
//

import Foundation

@objc public class TimeInterval: NSObject {
    @objc let startTime: Double
    @objc let endTime: Double
    
    @objc init(startTime: Double, endTime: Double) {
        self.startTime = startTime
        self.endTime = endTime
    }
    
    var closedRange: ClosedRange<Double> {
        return startTime...endTime
    }
}

public extension ClosedRange where Bound == Double {
    public var timeInterval: TimeInterval {
        return TimeInterval(startTime: lowerBound, endTime: upperBound)
    }
}
