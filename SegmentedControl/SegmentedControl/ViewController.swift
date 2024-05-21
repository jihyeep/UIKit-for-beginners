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
        
//        let button = UIButton(type: .system) // 기본형
        
        let button = UIButton(type: .custom) // 커스텀
        // config를 써주면 아래 코드는 쓰지 않음 -> 버튼에 직접 적용
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 10
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.white.cgColor
        
        // configuration에 스타일을 적용하여 버튼에 반영시킴
        var config = UIButton.Configuration.filled()
        
        config.title = "Click me"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20) // 패딩
        button.configuration = config
        
//        button.setTitle("Click me", for: .normal) // 눌리지 않은 상태
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
