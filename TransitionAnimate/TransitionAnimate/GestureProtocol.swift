//
//  GestureProtocol.swift
//  TransitionAnimate
//
//  Created by 句芒 on 2017/7/11.
//  Copyright © 2017年 fanwei. All rights reserved.
//

import Foundation
import UIKit
protocol GestureProtocol {
    func addGesture(_ target:Any,action a:Selector,view:UIView)
}
extension GestureProtocol {
    func addGesture(_ target:Any,action a:Selector,view:UIView) {
        let recognizer = UIPanGestureRecognizer(target:target , action: a)
        view.addGestureRecognizer(recognizer)
    }
}
