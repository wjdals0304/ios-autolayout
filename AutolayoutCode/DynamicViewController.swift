//
//  DynamicViewController.swift
//  AutolayoutCode
//
//  Created by 김정민 on 2021/12/08.
//

import UIKit

class DynamicViewController: UIViewController {

    @IBOutlet var stackView : UIStackView!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func adjustButtonDynamicType() {
        
        buttons.forEach { (button) in
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }
    
    
    @IBAction func addView() {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        
        label.text = """
                    asdfasdf
                 asfdasdfsadf
                 asdfas
                 dfasdfasdfsadf

                 """
        label.numberOfLines = 0
        
        // Dynamic sizes <- 사이즈 크기를 동적으로 조절할 수 있게 하는 옵션
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    @IBAction func removeView() {
        guard let last = stackView.arrangedSubviews.last else { return }
        
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { (_) in
            self.stackView.removeArrangedSubview(last)
        }


    }
}
