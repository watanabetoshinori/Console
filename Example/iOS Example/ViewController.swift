//
//  ViewController.swift
//  iOS Example
//
//  Created by Toshinori Watanabe on 3/23/18.
//  Copyright © 2018 Toshinori Watanabe. All rights reserved.
//

import UIKit
import Console

class ViewController: UIViewController {

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Actions

    @IBAction func printDate(_ sender: Any) {
        Console.log("\(Date()) [\((#file as NSString).lastPathComponent):\(#line) \(#function)]")
    }

}
