//
//  KeyboardLocationReaderView+Notification.swift
//  KeyboardLocationReader
//
//  Created by 秋星桥 on 2024/11/26.
//

import MSDisplayLink
import UIKit

extension KeyboardLocationReaderView: DisplayLinkDelegate {
    @objc func keyboardWillAppear(_: Notification) {
        activateMonitor()
    }

    @objc func keyboardWillDisappear(_: Notification) {
        activateMonitor()
    }

    @objc
    func activateMonitor(dismissAfter: TimeInterval = 0.75) {
        activateDisplayLink()
        NSObject.cancelPreviousPerformRequests(
            withTarget: self,
            selector: #selector(teardownDisplayLink),
            object: nil
        )
        perform(
            #selector(teardownDisplayLink),
            with: nil,
            afterDelay: dismissAfter
        )
    }

    @objc
    private func activateDisplayLink() {
        guard displayLink == nil else { return }
        let newLink = DisplayLink()
        displayLink = newLink
        newLink.delegatingObject(self)
    }

    public func synchronization() {
        DispatchQueue.main.async { [self] in
            recalculatesHeight()
        }
    }

    @objc
    private func teardownDisplayLink() {
        displayLink = nil
    }
}
