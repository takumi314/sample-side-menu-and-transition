//
//  SideMenuViewController.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/18.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    ///
    /// 1.0 :  完全に見えた状態
    /// 0.0 :  contentView が見えない
    ///
    var contentRatio: CGFloat {
        get {
            return 0.8
        }
        set {
            let radio: CGFloat = min(max(newValue, 0), 1)

            // 

            view.backgroundColor = UIColor(white: 0.0, alpha: 0.3 * radio)
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    private func showContentView(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.contentRatio = 1.0
            }
        } else {
            contentRatio = 1.0
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
