//
//  SideMenuBaseController.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/23.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class SideMenuBaseController: UIViewController {

    private var menu: SideMenuTableViewController!

    ///
    /// コンテナ用のビュー
    ///
    private var contentView: ContentView!

    ///
    /// 自身が表示中ならばtrueを返す
    ///
    var iShown: Bool {
        return self.parent != .none
    }

    private var contentMaxWidth: CGFloat {
        return view.bounds.width * 0.8
    }

    ///
    /// 1.0 :  完全に見えた状態
    /// 0.0 :  contentView が見えない
    ///
    var contentRatio: CGFloat {
        get {
            return 0.8
        }
        set {
            let ratio = min(max(newValue, 0), 1)

            contentView.frame.origin.x = contentMaxWidth * ratio - contentView.frame.width
            contentView.layer.shadowColor = UIColor.black.cgColor
            contentView.layer.shadowRadius = 3.0
            contentView.layer.shadowOpacity = 0.8

            view.backgroundColor = UIColor(white: 0.0, alpha: 0.3 * ratio)
        }
    }


    // MARK: - Private property

    ///
    /// return true if SideMenu is presenteted on self.
    ///
    private var isShownSidemenu: Bool {
        return self.parent == self
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let sb = UIStoryboard(name: "Main", bundle: nil)
        menu = sb.instantiateViewController(withIdentifier: "SideMenuTableViewController")
            as! SideMenuTableViewController

        let tap = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        view.addGestureRecognizer(tap)

        
//        view.backgroundColor = .clear
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showSidemenu(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func backgroundTapped() {
        hideContentView(animated: true) { (finished) in
            self.dismiss(animated: false, completion: nil)
        }
    }


    // MARK: - Private

    private func showSidemenu(contentAvailability: Bool = true, animated: Bool) {
        if isShownSidemenu {
            return
        }

        let content = ContentView.create(self.view.bounds, max: contentMaxWidth)
        content.build()

        self.view.addSubview(content)
        self.contentView = content

        add(menu, onto: content.bounds)

//        if contentAvailability {
//            showContentView(animated: true)
//        }
    }

    private func showContentView(animated: Bool) {

        if animated {
            UIView.animate(withDuration: 0.5) {
                self.contentRatio = 1.0
            }
        } else {
            contentRatio = 1.0
        }
    }

    func hideContentView(animated: Bool, completion: ((Bool) -> Swift.Void)?) {
        if animated {
            UIView.animate(withDuration: 0.5, animations: {
                self.contentRatio = 0.0
            }) {(finished) in
                completion?(finished)
            }
        } else {
            contentRatio = 0.0
            completion?(true)
        }
    }

}
