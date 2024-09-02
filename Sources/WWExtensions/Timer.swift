//
//  Timer.swift
//
//  Created by Sun on 2022/9/20.
//

import Foundation

extension Timer {
    @discardableResult
    public static func fireAfter(
        _ interval: TimeInterval,
        repeats: Bool = false,
        runLoopModes: RunLoop.Mode = RunLoop.Mode.common,
        action: (() -> Void)? = nil
    )
        -> Timer {
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
    // MARK: Properties

    var action: (() -> Void)?

    // MARK: Functions

    @objc
    func timerEvent() {
        action?()
    }
}
