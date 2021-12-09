//
//  LoginViewController.swift
//  AutolayoutCode
//
//  Created by 김정민 on 2021/12/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var buttons : [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
        
        
    }
    
    @objc func adjustButtonDynamicType() {
        
        buttons.forEach { (button) in
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
    
}
