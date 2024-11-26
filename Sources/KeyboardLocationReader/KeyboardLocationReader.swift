// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public enum KeyboardLocationReader {
    public static func makeView() -> KeyboardLocationReaderView {
        let view = KeyboardLocationReaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = .init(x: 0, y: 0, width: 2, height: 2)
        return view
    }

    public static func wrappingAround(_ view: UIView) -> UIView {
        let container = makeView()
        container.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
        view.layoutIfNeeded()
        return container
    }
}
