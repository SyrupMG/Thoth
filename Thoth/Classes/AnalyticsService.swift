//
//  AnalyticsService.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 26/11/2018.
//

import Foundation

public protocol AnalyticsEvent {
    var name: String { get }
    var parameters: [String: Any]? { get }
}

public protocol AnalyticsPlayableContent {
    var uniqueName: String { get }
    var totalLength: TimeInterval { get }
}

public protocol AnalyticServiceDelegate: AnyObject {
    /// Вероятнее всего, будет вызван как следствие работы `log(_ playedInterval: Interval, of content: AnalyticsPlayableContent)`
    ///
    /// - Parameters:
    ///   - content: Контент
    ///   - progress: Прогресс в процентах. 0...1
    func contentProgressChanged(_ content: AnalyticsPlayableContent, progress: Double)
}

public protocol AnalyticsServiceProvider {
    func configure()
    func log(_ event: AnalyticsEvent)
}

public protocol AnalyticsService: AnyObject {
    typealias Interval = ClosedRange<Double>
    var delegate: AnalyticServiceDelegate? { get set }
    
    func configure()
    func register(providers: AnalyticsServiceProvider...)
    
    func log(_ event: AnalyticsEvent)
    /// Стартуем "измерительный ивент". После запуска, нам возвращается кложура, которую надо вызвать
    /// После того, как измеряемый промежуток закроется. После "закрытия", будет отправлен `event`
    ///
    /// Пример:
    /// 1) Стартуем startMeasuringDuration
    /// 2) Запускаем сетевой запрос
    /// 3) Когда получаем результат, вызываем кложуру, полученную во время пункта 1
    func startMeasuringDuration(of event: AnalyticsEvent) -> () -> Void
    
    
    /// Логирует. Сервис сам занимается хранением информации о предыдущих логах.
    /// Если общий прогресс по одному контенту изменяется, будет вызван метод делегата
    ///
    /// - Parameters:
    ///   - playedInterval: Интервал, который был проигран в хост приложении
    ///   - content: Контент
    func log(_ playedInterval: Interval, of content: AnalyticsPlayableContent)
    
    /// Очищает логированную информацию о данному контенту
    func clearPlayedProgress(of content: AnalyticsPlayableContent)
}
