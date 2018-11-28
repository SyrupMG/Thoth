//
//  OrderedNonOverlappingIntervals.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 27/11/2018.
//

import Foundation

// --- Внимание!
// --- После внесения любых изменений в данный файл (включая extension), необходимо как минимум убедиться, что проходит TestOrderedNonOverlappingIntervals, а в идеале - предварительно дополнить его тестами на новую функциональность

public struct OrderedNonOverlappingIntervals { //ordered
    
    public var intervals = [ClosedRange<Range<Int>.Bound>]()
    
    public init() {}
    
    public mutating func add(_ interval: ClosedRange<Range<Int>.Bound>) {
        
        guard !interval.isEmpty else { return }
        
        guard !self.intervals.isEmpty else {
            self.intervals.append(interval)
            return
        }
        
        var resultIntervals: [ClosedRange<Int>?] = self.intervals
        var intervalToAdd = interval
        
        
        for (index, interval) in self.intervals.enumerated() {
            
            //если интервалы не пересекаются
            guard interval.overlaps(intervalToAdd) else {
                
                //если интервал идёт перед текущим, просто вставляем его перед текущим
                if intervalToAdd.isStrictlyBefore(interval) {
                    resultIntervals.insert(intervalToAdd, at: index)
                    break
                    
                //если текущий - последний, просто добавляем интервал в конец
                } else if index == intervals.count - 1 {
                    resultIntervals.append(intervalToAdd)
                    break
                    
                //a иначе будем пытаться вставить его на дальшнейших итерациях цикла
                } else {
                    continue
                }
            }
            
            //если текущий интервал полностью включает в себя интервал, игнорируем его - он уже учтен
            if interval.includes(intervalToAdd) { break }
            
            //иначе объединяем интервал с текущим, удаляем текущий
            resultIntervals[index] = nil
            intervalToAdd.merge(interval)
            
             //если текущий - последний, добавляем объединенный интервал в конец
            if index == intervals.count - 1 {
                resultIntervals.append(intervalToAdd)
            }
        }
        
        self.intervals = resultIntervals.compactMap{$0}
    }
}

extension ClosedRange where Bound == Int {
    
    func includes(_ range: ClosedRange<Bound>) -> Bool {
        return self.lowerBound <= range.lowerBound && self.upperBound >= range.upperBound
    }
    
    func isStrictlyBefore(_ range: ClosedRange<Bound>) -> Bool {
        return self.upperBound < range.lowerBound
    }
    
    func merging(_ range: ClosedRange<Bound>) -> ClosedRange<Bound> {
        return Swift.min(self.lowerBound, range.lowerBound) ... Swift.max(self.upperBound, range.upperBound)
    }
    
    mutating func merge(_ range: ClosedRange<Bound>) -> Void {
        self = Swift.min(self.lowerBound, range.lowerBound) ... Swift.max(self.upperBound, range.upperBound)
    }
}
