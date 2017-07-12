//
//  CellView.swift
//  TransitionAnimate
//
//  Created by 句芒 on 2017/7/11.
//  Copyright © 2017年 fanwei. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var timeStepper: UIStepper!
    @IBOutlet weak var useModal: UISwitch!
    @IBOutlet weak var animateName: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        timeStepper.addTarget(self, action: #selector(CellView.animateTime), for: .valueChanged)
    
    }
    
    func animateTime() {
        timeLabel.text = "动画时间:\(timeStepper.value)"
    }
}
