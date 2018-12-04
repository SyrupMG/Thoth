//
//  AnalyticsService.swift
//  Pods-Thoth_Example
//
//  Created by Малышева Татьяна Юрьевна on 26/11/2018.
//

import Foundation

@objc public protocol AnalyticsEvent {
    @objc var name: String { get }
    @objc var parameters: [String: Any]? { get }
}

@objc public protocol AnalyticsPlayableContent {
    @objc var uniqueName: String { get }
    @objc var totalLength: Double { get }
}

@objc public protocol AnalyticServiceDelegate: AnyObject {
    /// Вероятнее всего, будет вызван как следствие работы `log(_ playedInterval: Interval, of content: AnalyticsPlayableContent)`
    ///
    /// - Parameters:
    ///   - content: Контент
    ///   - progress: Прогресс в процентах. 0...1
    @objc func contentProgressChanged(_ content: AnalyticsPlayableContent, progress: Double)
}

@objc public protocol AnalyticsServiceProvider {
    @objc func configure()
    @objc func log(_ event: AnalyticsEvent)
}

@objc public protocol AnalyticsService: AnyObject {
    typealias Interval = TimeInterval
    @objc var delegate: AnalyticServiceDelegate? { get set }
    
    @objc func configure()
    @objc func register(providers: [AnalyticsServiceProvider])
    
    @objc func log(_ event: AnalyticsEvent)
    /// Стартуем "измерительный ивент". После запуска, нам возвращается кложура, которую надо вызвать
    /// После того, как измеряемый промежуток закроется. После "закрытия", будет отправлен `event`
    ///
    /// Пример:
    /// 1) Стартуем startMeasuringDuration
    /// 2) Запускаем сетевой запрос
    /// 3) Когда получаем результат, вызываем кложуру, полученную во время пункта 1
    @objc func startMeasuringDuration(of event: AnalyticsEvent) -> () -> Void
    
    /// Логирует. Сервис сам занимается хранением информации о предыдущих логах.
    /// Если общий прогресс по одному контенту изменяется, будет вызван метод делегата
    ///
    /// - Parameters:
    ///   - playedInterval: Интервал, который был проигран в хост приложении
    ///   - content: Контент
    @objc func log(_ playedInterval: Interval, of content: AnalyticsPlayableContent)
    
    /// Очищает логированную информацию о данному контенту
    @objc func clearPlayedProgress(of content: AnalyticsPlayableContent)
}
