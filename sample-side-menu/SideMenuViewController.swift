//
//  SideMenuViewController.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/18.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit


class ContentView: UIView {
    static func create(_ bounds: CGRect, max width: CGFloat) -> ContentView {
        let view = ContentView(frame: bounds)
        view.frame.size.width = width
        view.frame.origin.x = -bounds.width
        view.autoresizingMask = .flexibleHeight
        return view
    }
    func build() {
        self.backgroundColor = .blue
    }
}


class SideMenuViewController: UIViewController {

    private var contentView: ContentView!

    ///
    /// 自身が表示中なrばtrueを返す
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


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Public

    func showContentView(animated: Bool) {

        let content = ContentView.create(self.view.bounds, max: contentMaxWidth)
        content.build()

        self.view.addSubview(content)

        self.contentView = content


        if animated {
            UIView.animate(withDuration: 0.5) {
                self.contentRatio = 1.0
            }
        } else {
            contentRatio = 1.0
        }
    }


    // MARK: - Private



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
