//
//  ViewController.swift
//  Image
//
//  Created by 박지혜 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 원
        let circleView = UIView()
        circleView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        circleView.backgroundColor = .yellow
        circleView.layer.cornerRadius = 50
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(circleView)
        
        let squareView = UIView()
        squareView.frame = CGRect(x: 220, y: 100, width: 100, height: 100)
        squareView.backgroundColor = .blue
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds // bounds: 실측 크기
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor] // 빨강에서 주황 그라데이션
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // 좌측 상단
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // 우측 하단
        squareView.layer.insertSublayer(gradientLayer, at: 0) // 첫 번째 레이어
        
        view.addSubview(squareView)
    }


}

