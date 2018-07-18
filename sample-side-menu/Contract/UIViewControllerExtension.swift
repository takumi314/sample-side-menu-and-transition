//
//  UIViewControllerExtension.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/17.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

extension UIViewController: ViewControllerPresentable {

    func add(_ child: UIViewController, onto frame: CGRect?) {

        // Add the view controller as a child
        addChildViewController(child)

        // Move the child view controller's view to the parent's view
        view.addSubview(child.view)

        if let frame = frame {
            child.view.frame = frame
        }


        // Notify the child that it was moved to a parent
        didMove(toParentViewController: self)
    }

    func remove() {
        guard let _ = self.parent else {
            return
        }


        // Notify the child that it's about to be moved away from its parent
        willMove(toParentViewController: nil)

        // Remove the child
        removeFromParentViewController()

        // Remove the child view controller's view from its parent
        view.removeFromSuperview()
    }
    
}
