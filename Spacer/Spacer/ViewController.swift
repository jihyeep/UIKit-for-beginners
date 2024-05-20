//
//  ViewController.swift
//  Spacer
//
//  Created by 박지혜 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelLeft = UILabel()
        labelLeft.text = "왼쪽"
        labelLeft.backgroundColor = .lightGray
        
        let labelRight = UILabel()
        labelRight.text = "오른쪽"
        labelRight.backgroundColor = .lightGray
        
        let spacer = UIView()
        // spacer 뷰의 우선순위를 low로 설정하여 다른 뷰들(label)이 더 많은 공간을 필요로 할 때 spacer가 해당 공간을 양보하도록 설계됨
        // spacer 뷰는 수평 방향으로 쉽게 확장되고 축소됨
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        stackView.addArrangedSubview(labelLeft)
        stackView.addArrangedSubview(spacer)
        stackView.addArrangedSubview(labelRight)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
    }


}

