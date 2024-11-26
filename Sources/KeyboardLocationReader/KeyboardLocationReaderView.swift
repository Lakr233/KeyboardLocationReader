//
//  KeyboardLocationReaderView.swift
//  Intelligents
//
//  Created by 秋星桥 on 2024/11/26.
//

import MSDisplayLink
import UIKit

public class KeyboardLocationReaderView: UIView, ObservableObject {
    public weak var delegate: KeyboardLocationReaderDelegate?

    var displayLink: DisplayLink?

    // negative value corresponds to the absolute keyboard's height
    @Published var absoluteLocationOffsetOnKeyboardHeight: CGFloat = 0 {
        didSet { delegate?.onKeyboardAbsoluteHeightInWindowChanges(absoluteLocationOffsetOnKeyboardHeight) }
    }

    public init() {
        super.init(frame: .zero)
        commitInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }

    func commitInit() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillDisappear),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillAppear),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        activateMonitor()
    }
}
