//
//  ViewController.swift
//  Gesture
//
//  Created by 박지혜 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rectangle = UIView()
        rectangle.backgroundColor = .yellow
        rectangle.frame = CGRect(x: 100, y: 100, width: 175, height: 125)
        rectangle.isUserInteractionEnabled = true // 이벤트 핸들링 가능하도록
        
        view.addSubview(rectangle)
        
        // Tap
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        tapGesture.numberOfTapsRequired = 2 // 탭을 2번 해야 함
//        rectangle.addGestureRecognizer(tapGesture) // 탭 2번 하면 배경색이 변함
        
        // LongPress
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGesture.minimumPressDuration = 2.0
        longPressGesture.view?.addGestureRecognizer(longPressGesture)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }
    
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == .green) ? .red : .green
        }
    }

}

