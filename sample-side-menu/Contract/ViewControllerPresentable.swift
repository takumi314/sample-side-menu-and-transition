//
//  ViewControllerPresentable.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/17.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol ViewControllerPresentable {
    func add(_ child: UIViewController, onto frame: CGRect?)
    func remove()
}

extension ViewControllerPresentable where Self: UIViewController { }
