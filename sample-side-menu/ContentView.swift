//
//  ContentView.swift
//  sample-side-menu
//
//  Created by NishiokaKohei on 2018/07/20.
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


