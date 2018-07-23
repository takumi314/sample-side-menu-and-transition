//
//  MainViewController.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/11.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {


    // MARK: - Private

    private var sidemeneViewController: SideMenuViewController

    ///
    /// return true if SideMenu is presenteted on self.
    ///
    private var isShownSidemenu: Bool {
        return sidemeneViewController.parent == self
    }

    // MARK: - Initializer

    init(_ child: SideMenuViewController) {
        self.sidemeneViewController = child
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        self.sidemeneViewController = SideMenuViewController()
        super.init(coder: aDecoder)
    }


    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView))
//        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - IBActions

    @IBAction func onTappedMenu(_ sender: UIBarButtonItem) {
//        let base = SideMenuBaseController(SideMenuViewController())
//        base.modalPresentationStyle = .overFullScreen
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc =  sb.instantiateViewController(withIdentifier: "SideMenuBaseController")

        navigationController?.present(vc, animated: false, completion: nil)
//        navigationController?.present(base, animated: false, completion: nil)
    }


    // MARK: - TapGesture

    @objc func didTapView() {
//        showSidemenu(animated: true)
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


