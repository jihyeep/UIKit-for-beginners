//
//  ViewController.swift
//  Text
//
//  Created by 박지혜 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let label = UILabel()
//        label.text = "This is a long text that should wrap into multiple lines if it exceeds the width of the label."
        label.text = "Stylized Text"
        label.textColor = .yellow
        label.backgroundColor = .red
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        
//        label.numberOfLines = 0 // 여러 줄 표시
//        label.lineBreakMode = .byWordWrapping // 경계를 넘어갈 때 단어의 줄 변경
        
        // 둥근 모서리 적용
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        // 여러 줄 실습
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
//        ])
        
        // 둥근 모서리 실습
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }


}

