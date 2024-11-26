//
//  ViewController.swift
//  Example
//
//  Created by 秋星桥 on 2024/11/26.
//

import KeyboardLocationReader
import UIKit

class ViewController: UIViewController, KeyboardLocationReaderDelegate {
    let receiver = UILabel()
    let textView = UITextView()
    let locationReader = KeyboardLocationReader.makeView()

    override func viewDidLoad() {
        super.viewDidLoad()

        receiver.text = "Height Receiver Label"
        receiver.translatesAutoresizingMaskIntoConstraints = false
        receiver.numberOfLines = 0
        receiver.textAlignment = .center
        view.addSubview(receiver)
        view.bringSubviewToFront(receiver)
        onKeyboardAbsoluteHeightInWindowChanges(0)

        textView.inputAccessoryView = locationReader
        view.addSubview(textView)

        textView.layer.borderColor = UIColor.gray.withAlphaComponent(0.25).cgColor
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 8
        textView.font = .systemFont(ofSize: 18)
        textView.backgroundColor = .clear
        textView.contentInset = .zero
        textView.textContainerInset = .zero
        textView.isEditable = true
        textView.text = """
        We’re pleased to welcome you to the App Store Small Business Program. The commission rate on your paid apps and in-app purchases is now 15%, so you can invest more resources into your business to continue building quality apps that customers love.
        """

        locationReader.delegate = self

        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let width = view.frame.width * 0.8
        let height: CGFloat = 300
        textView.frame = CGRect(
            x: (view.frame.width - width) / 2,
            y: view.bounds.height * 0.1,
            width: width,
            height: height
        )
    }

    func onKeyboardAbsoluteHeightInWindowChanges(_ height: CGFloat) {
        print("[+] keyboard height in window: \(height)")
        let receiverSize = receiver.sizeThatFits(.init(
            width: view.frame.width,
            height: .infinity
        ))
        let bounds = view.bounds
        UIView.animate {
            receiver.frame = .init(
                x: (bounds.width - receiverSize.width) / 2,
                y: bounds.height - receiverSize.height - height,
                width: receiverSize.width,
                height: receiverSize.height
            )
        }
    }
}

extension UIViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
