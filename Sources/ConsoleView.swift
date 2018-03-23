//
//  ConsoleView.swift
//  Console
//
//  Created by Toshinori Watanabe on 3/23/18.
//  Copyright © 2018 Toshinori Watanabe. All rights reserved.
//

import UIKit

@IBDesignable
public class ConsoleView: UITextView {

    var token: NSObjectProtocol?

    // MARK: - Initializing a View Object

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    override public func prepareForInterfaceBuilder() {
        setupUI()
    }

    private func setup() {
        setupUI()

        text = Console.shared.output

        scrollToBottom()

        token = NotificationCenter.default.addObserver(forName: .ConsoleDidOutputLog, object: nil, queue: .main) { (notification) in
            guard let new = notification.object as? String else {
                return
            }

            self.appendLog(log: new)
        }
    }

    private func setupUI() {
        isEditable = false

        autocorrectionType = .no
        autocapitalizationType = .none
        if #available(iOSApplicationExtension 11.0, *) {
            smartDashesType = .no
            smartQuotesType = .no
        }
        spellCheckingType = .no

        indicatorStyle = .white

        backgroundColor = .black
        textColor = .white

        font = UIFont(name: "Menlo", size: CGFloat(14))
    }

    deinit {
        NotificationCenter.default.removeObserver(token as Any)
    }

    // MARK: - Append New Log

    private func appendLog(log: String) {

        let shouldScrollToBottom: Bool = {
            // Scrolling to bottom if current screen shows bottom line of TextView.
            let contentHeight = contentSize.height
            let visibleHeight = contentOffset.y + bounds.size.height

            if (contentHeight - visibleHeight) <= 10 {
                return true
            }

            return false
        }()

        let newText = text + log

        if text.isEmpty || selectedTextRange?.isEmpty == true {
            text = newText
        } else {
            // Updating TextStorage directly to avoid changing the selection range.
            textStorage.beginEditing()
            textStorage.replaceCharacters(in: NSRange(location: 0, length: textStorage.length), with: newText)
            textStorage.endEditing()
        }

        if shouldScrollToBottom {
            scrollToBottom()
        }
    }

    // MARK: - Scrolling

    private func scrollToBottom() {
        let rect = caretRect(for: endOfDocument)
        scrollRectToVisible(rect, animated: false)
    }

}
