//
//  KeyboardLocationReader+Delegate.swift
//  KeyboardLocationReader
//
//  Created by 秋星桥 on 2024/11/26.
//

import Foundation

public protocol KeyboardLocationReaderDelegate: AnyObject {
    func onKeyboardAbsoluteHeightInWindowChanges(_ height: CGFloat)
//    func onKeyboardAnimationCaptured(_ animationInfo: Any)
}
