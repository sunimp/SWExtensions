//
//  Timer.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

extension Timer {

    @discardableResult
    public static func fireAfter(
        _ interval: TimeInterval,
        repeats: Bool = false,
        runLoopModes: RunLoop.Mode = RunLoop.Mode.common,
        action: (() -> Void)? = nil
    ) -> Timer {
        let actionTimer = ActionTimer()
        actionTimer.action = action

        let timer = Timer(
            fireAt: Date(timeIntervalSinceNow: interval),
            interval: interval,
            target: actionTimer,
            selector: #selector(actionTimer.timerEvent),
            userInfo: nil,
            repeats: repeats
        )
        RunLoop.main.add(timer, forMode: runLoopModes)

        return timer
    }

}

// MARK: - ActionTimer

private class ActionTimer {

    var action: (() -> Void)?

    @objc
    func timerEvent() {
        action?()
    }
}
