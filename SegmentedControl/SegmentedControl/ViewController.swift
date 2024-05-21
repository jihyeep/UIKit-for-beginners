//
//  ViewController.swift
//  SegmentedControl
//
//  Created by 박지혜 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system) // 기본형
        button.setTitle("Click me", for: .normal) // 눌리지 않은 상태
        button.addAction(UIAction { [weak self] _ in
            self?.count += 1
            print("Button was tapped! \(self?.count ?? 0)")
        }, for: .touchUpInside) // 터치 후 뗄 때 실행
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

