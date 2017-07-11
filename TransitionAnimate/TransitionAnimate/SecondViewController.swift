//
//  SecondViewController.swift
//  TransitionAnimate
//
//  Created by 句芒 on 2017/7/11.
//  Copyright © 2017年 fanwei. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,GestureProtocol {

    override func loadView() {
        super.loadView()
        let view = Bundle.main.loadNibNamed("SecondViewController", owner: nil, options: nil)?.last as! UIView
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGesture(self, action:#selector(SecondViewController.back), view: self.view)
    }

    func back()  {
        if let controller = self.navigationController {
            controller .popToRootViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
  
    override func viewWillAppear(_ animated: Bool) {
        self.view.frame = UIScreen.main.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
