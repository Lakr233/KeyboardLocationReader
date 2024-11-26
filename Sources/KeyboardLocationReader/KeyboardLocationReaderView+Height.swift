//
//  KeyboardLocationReaderView+Height.swift
//  KeyboardLocationReader
//
//  Created by 秋星桥 on 2024/11/26.
//

import UIKit

extension KeyboardLocationReaderView {
    @objc func recalculatesHeight() {
        assert(Thread.isMainThread)
        guard let window else {
            if absoluteLocationOffsetOnKeyboardHeight != 0 {
                absoluteLocationOffsetOnKeyboardHeight = 0
            }
            return
        }
        let frameInWindow = convert(bounds, to: window)
        let bottom = max(0, window.bounds.height - frameInWindow.maxY)
        guard bottom != absoluteLocationOffsetOnKeyboardHeight else {
            return
        }
        absoluteLocationOffsetOnKeyboardHeight = bottom
    }
}
