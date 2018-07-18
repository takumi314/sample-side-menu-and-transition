//
//  MainViewController.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/11.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    // MARK: - Private

    private var contentViewController: UIViewController
    private var sidemeneViewController: SideMenuViewController

    ///
    /// return true if SideMenu is presenteted on self.
    ///
    private var isShownSidemenu: Bool {
        return sidemeneViewController.parent == self
    }

    // MARK: - Initializer

    init(_ child: SideMenuViewController) {
        self.contentViewController = UIViewController()
        self.sidemeneViewController = child
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        self.contentViewController = UIViewController()
        self.sidemeneViewController = SideMenuViewController()
        super.init(coder: aDecoder)
    }


    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Private

    private func showSidemenu(contentAvailability: Bool = true, animated: Bool) {
        if isShownSidemenu {
            return
        }

        add(sidemeneViewController, onto: self.view.bounds)

        if contentAvailability {
            sidemeneViewController.showContentView(animated: true)
        }

    }


}


