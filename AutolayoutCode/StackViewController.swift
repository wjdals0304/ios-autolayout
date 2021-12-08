//
//  StackViewController.swift
//  AutolayoutCode
//
//  Created by 김정민 on 2021/12/07.
//

import UIKit

class StackViewController: UIViewController {

    var stackView: UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vertical = UIStackView()
        
        vertical.axis = .vertical
        vertical.translatesAutoresizingMaskIntoConstraints = false
        vertical.spacing = 10
        vertical.distribution = .fillEqually
        view.addSubview(vertical)

        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontal)

        let addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.addTarget(self, action: #selector(addView), for: .touchUpInside)

        let removeButton = UIButton()
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.blue, for: .normal)
        removeButton.addTarget(self, action: #selector(removeView), for: .touchUpInside)

        horizontal.addArrangedSubview(addButton)
        horizontal.addArrangedSubview(removeButton)

        horizontal.distribution = .fillEqually

        horizontal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        horizontal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true

        horizontal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        vertical.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vertical.bottomAnchor.constraint(equalTo: horizontal.topAnchor).isActive = true
        vertical.leadingAnchor.constraint(equalTo: horizontal.leadingAnchor).isActive = true

        vertical.trailingAnchor.constraint(equalTo: horizontal.trailingAnchor).isActive = true
    
    }
    
    @objc func addView() {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.isHidden = true
        self.stackView.addArrangedSubview(view)
        
        UIView.animate(withDuration: 0.3) {
            view.isHidden = false
        }
    }
    
    @objc func removeView() {
        guard let last = stackView.arrangedSubviews.last else { return }
        
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { (_) in
            self.stackView.removeArrangedSubview(last)
        }


    }


}
