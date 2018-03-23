//
//  Console.swift
//  Console
//
//  Created by Toshinori Watanabe on 3/23/18.
//  Copyright © 2018 Toshinori Watanabe. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    static let ConsoleDidOutputLog = Notification.Name("ConsoleDidOutputLog")
}

public class Console: NSObject {

    var output = ""

    // MARK: - Initializing a Singleton

    static let shared = Console()

    override private init() {

    }

    // MARK: - Output Log

    public class func log(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        let new = items.map({ "\($0)" }).joined(separator: separator) + terminator

        let block = {
            shared.output += new
            NotificationCenter.default.post(name: .ConsoleDidOutputLog, object: new)
        }

        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async {
                block()
            }
        }
    }

}
