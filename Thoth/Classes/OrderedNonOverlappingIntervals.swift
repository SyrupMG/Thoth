//
//  OrderedNonOverlappingIntervals.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 27/11/2018.
//

import Foundation

// --- Внимание!
// --- После внесения любых изменений в данный файл (включая extension), необходимо как минимум убедиться, что проходит TestOrderedNonOverlappingIntervals, а в идеале - предварительно дополнить его тестами на новую функциональность

extension ClosedRange: Codable where Bound == Double {
    enum CodingKeys: String, CodingKey {
        case lowerBound
        case upperBound
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let lowerBound = try container.decode(Bound.self, forKey: .lowerBound)
        let upperBound = try container.decode(Bound.self, forKey: .upperBound)
        self = lowerBound...upperBound
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lowerBound, forKey: .lowerBound)
        try container.encode(upperBound, forKey: .upperBound)
    }
}

public struct OrderedNonOverlappingIntervals: Codable { //ordered
    public typealias Bound = Range<Double>.Bound
    public typealias RangeType = ClosedRange<Bound>
    
    public private(set) var intervals = [RangeType]()
    
    public init() {}
    
    // если интервалы пересекаются или не упорядочены, то они будут преобразованы в неперескающиеся и упорядоченные
    public init (from array: [RangeType]) {
        
        guard !array.isEmpty else { return }
        self = array.convertToOrderedNonOverlappingIntervals()
    }
    
    public mutating func add(_ interval: RangeType) {
        
        guard !interval.isEmpty else { return }
        
        guard !self.intervals.isEmpty else {
            self.intervals.append(interval)
            return
        }
        
        var resultIntervals: [RangeType?] = self.intervals
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
    
    public func sum() -> Bound {
        return self.intervals.map{ $0.length() }.reduce(0, +)
    }
}

extension ClosedRange where Bound == OrderedNonOverlappingIntervals.Bound {
    
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
    
    func length() -> OrderedNonOverlappingIntervals.Bound {
        return self.upperBound - self.lowerBound + 1
    }
}
    
extension Array where Element == ClosedRange<OrderedNonOverlappingIntervals.Bound> {
    
     func convertToOrderedNonOverlappingIntervals() -> OrderedNonOverlappingIntervals {
        
        var result = OrderedNonOverlappingIntervals()
            
        guard !self.isEmpty else { return result }
        
        for interval in self {
            result.add(interval)
        }
        
        return result
    }
}

