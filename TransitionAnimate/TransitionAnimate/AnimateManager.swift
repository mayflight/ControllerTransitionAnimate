//
//  AnimateManager.swift
//  ControllerTransition
//
//  Created by 句芒 on 2017/6/14.
//  Copyright © 2017年 fanwei. All rights reserved.
//

import Foundation
import UIKit

enum TransitionAnimateType:Int {
    case scaleAlpha = 0
    case fromTop
    case toLeft
    static func count() -> NSInteger {
        return 3
    }
    static func value(_ index:Int) -> String {
        return ["scaleAlpha","fromTop","toLeft"][index]
    }
}

class AnimateManager: NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate,AnimateProtocol,UINavigationControllerDelegate{
    
    var animateType = TransitionAnimateType.scaleAlpha
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let view = transitionContext.containerView
        
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        if fromView == nil || toView == nil {
            return
        }
        view.backgroundColor = UIColor.white
        view.addSubview(fromView!)
        view.addSubview(toView!)
        switch animateType {
        case .scaleAlpha:
            scaleAlpha(fromView!, toView!, context: transitionContext)
        case .fromTop:
            fromTop(fromView!, toView!, context: transitionContext)
        case .toLeft:
            toLeft(fromView!, toView!, context: transitionContext)
        }
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    

}