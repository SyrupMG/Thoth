//
//  DefaultAnalyticsService.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 29/11/2018.
//

import Foundation

class DefaultAnalyticsService: AnalyticsService {
    weak var delegate: AnalyticServiceDelegate?
    
    static let shared = DefaultAnalyticsService()
    private init(){
        playingContentIntervals = [:]
        loadFromPersistant()
    }
    
    func configure() {
        providers.forEach{ $0.configure() }
    }
    
    private var providers: [AnalyticsServiceProvider] = []
    
    func register(providers: [AnalyticsServiceProvider]) {
        self.providers += providers.compactMap { newProvider in
            guard (self.providers.first(where: { String(describing: newProvider.self) == String(describing: $0.self) })) == nil else { return nil }
            return newProvider
        }
    }
    
    func log(_ event: AnalyticsEvent) {
        providers.forEach{ $0.log(event) }
    }
    
    func startMeasuringDuration(forTag tag: String) -> (AnalyticsEvent) -> Void {
        let ends = providers.compactMap { $0 as? MeasuringAnalyticsServiceProvider }.map { $0.startMeasuringDuration(forTag: tag) }
        return { event in ends.forEach { $0(event) } }
    }    

    func log(_ playedInterval: Interval, of content: AnalyticsPlayableContent) {
        var intervals = playingContentIntervals[content.uniqueName] ?? OrderedNonOverlappingIntervals()
        
        let oldOverallTime = intervals.sum()
        intervals.add(playedInterval.closedRange)
        let newOverallTime = intervals.sum()
        
        if (oldOverallTime != newOverallTime) {
            let percentProgress = newOverallTime / content.totalLength
            let safePercentProgress = max(min(1, percentProgress), 0)
            delegate?.contentProgressChanged(content, progress: safePercentProgress)
        }

        setIntervals(intervals, forContent: content)
    }
    
    func clearPlayedProgress(of content: AnalyticsPlayableContent) {
        playingContentIntervals.removeValue(forKey: content.uniqueName)
        saveToPersistant()
    }
    
    /// key is for content id, value is for progressed intervals
    private typealias PlayingContentType = [String: OrderedNonOverlappingIntervals]
    private let intervalsSaveId = "Thoth.playingContentIntervals"
    private var playingContentIntervals: PlayingContentType
    
    private func toDict(_ playingContentIntervals: PlayingContentType) -> [String: Any] {
        var output = [String:Any]()
        playingContentIntervals.forEach { element in
            output[element.key] = element.value.intervals.map { "\($0.lowerBound)!!!\($0.upperBound)" }
        }
        return output
    }
    
    private func fromDict(_ dict: [String: Any]) -> PlayingContentType {
        var output: PlayingContentType = [:]
        dict.forEach { element in
            guard let stringsArray = element.value as? [String] else { return }
            let rangesArray: [ClosedRange<Double>] = stringsArray.compactMap {
                let components = $0.components(separatedBy: "!!!")
                guard let lowerBound = Double(components.first ?? ""),
                    let upperBound = Double(components.last ?? "") else { return nil }
                return lowerBound...upperBound
            }
            output[element.key] = OrderedNonOverlappingIntervals(from: rangesArray)
        }
        return output
    }
    
    private func saveToPersistant() {
        UserDefaults.standard.set(toDict(playingContentIntervals), forKey: intervalsSaveId)
    }
    
    private func loadFromPersistant() {
        guard let dict = UserDefaults.standard.dictionary(forKey: intervalsSaveId) else { return }
        playingContentIntervals = fromDict(dict)
    }
    
    private func setIntervals(_ intervals: OrderedNonOverlappingIntervals, forContent content: AnalyticsPlayableContent) {
        playingContentIntervals[content.uniqueName] = intervals
        saveToPersistant()
    }
}
