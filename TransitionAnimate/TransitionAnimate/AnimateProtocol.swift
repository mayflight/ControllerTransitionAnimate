//
//  GesturePortocol.swift
//  ControllerTransition
//
//  Created by 句芒 on 2017/6/14.
//  Copyright © 2017年 fanwei. All rights reserved.
//

import Foundation
import UIKit
protocol AnimateProtocol {
    func scaleAlpha(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning)
    func fromTop(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning)
    func toLeft(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning)
    func fromTopLeftCorner(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning)
}

extension AnimateProtocol {
    func scaleAlpha(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning) {
        
        fromView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        fromView.alpha = 0.8
        toView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        toView.alpha = 0.1
        UIView.animate(withDuration: 1, animations: {
            fromView.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
            fromView.alpha = 0.2
            toView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            toView.alpha = 0.8
        }) { (finished) in
            fromView.transform = CGAffineTransform.identity
            toView.transform = CGAffineTransform.identity
            context.completeTransition(true)
        }
    }
    
    func fromTop(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning) {
        let frame = toView.frame
        toView.frame = CGRect(x: 0, y: -frame.size.height, width: frame.size.width, height: frame.size.height)
        UIView.animate(withDuration: 1, animations: {
            toView.frame = frame
        }) { (finished) in
            context.completeTransition(true)
        }
    }
    
    func toLeft(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning) {
        let frame = fromView.frame
        toView.frame = CGRect(x: 2*frame.size.width, y: 0, width: frame.size.width, height: frame.size.height)
        UIView.animate(withDuration: 1, animations: {
            fromView.frame = CGRect(x: -frame.size.width, y: 0, width: frame.size.width, height: frame.size.height)
            toView.frame = frame
        }) { (finished) in
            context.completeTransition(true)
        }
    }
    func fromTopLeftCorner(_ fromView:UIView ,_ toView:UIView ,context:UIViewControllerContextTransitioning) {
        let frame = fromView.frame
        toView.transform = CGAffineTransform.init(translationX: -frame.size.width, y: -frame.size.height)
        UIView.animate(withDuration: 1, animations: {
            toView.transform = CGAffineTransform.init(translationX: 0, y: 0)
        }) { (finished) in
            context.completeTransition(true)
        }

    }
}

