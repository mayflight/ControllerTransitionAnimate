//
//  ViewController.swift
//  TransitionAnimate
//
//  Created by 句芒 on 2017/7/11.
//  Copyright © 2017年 fanwei. All rights reserved.
//

import UIKit

class ViewController:UITableViewController {

 
    override func viewDidLoad() {
        self.tableView.register(UINib.init(nibName: "CellView", bundle: nil), forCellReuseIdentifier: "CellView")
    }

    let manager = AnimateManager()
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CellView
        let controller = SecondViewController()
        if let value = TransitionAnimateType(rawValue:indexPath.row) {
             manager.animateType = value
        }
        if cell.useModal.isOn {
            controller.transitioningDelegate = manager
            self.present(controller, animated: true, completion: nil)
        }else {
            self.navigationController?.delegate = manager
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TransitionAnimateType.count()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "CellView") as! CellView
        cell.animateName.text = TransitionAnimateType.value(indexPath.row)
        return cell
    }
    
}

