//
//  AnchorViewController.swift
//  AutolayoutCode
//
//  Created by 김정민 on 2021/12/06.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        // 코드로 레이아웃하려면 false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
        
        let safeBottomAnchor =   button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
        safeBottomAnchor.isActive = true
        safeBottomAnchor.priority = .defaultHigh
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor , constant: -20)
        
        viewBottomAnchor.isActive = true

        
        
        
    }
    



}
