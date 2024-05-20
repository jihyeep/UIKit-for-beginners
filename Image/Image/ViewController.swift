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
        circleView.clipsToBounds = true
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "Hello, World"
        
        circleView.addSubview(label)
        self.view.addSubview(circleView)
        
        // MARK: - 색 그라데이션
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
        
        // MARK: - Image Effect
        let imageView = UIImageView(image: UIImage(systemName: "hare.fill"))
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        imageView.tintColor = .purple
        imageView.contentMode = .scaleAspectFit // 이미지 비율 유지, 프레임에 딱 맞게
        
        imageView.layer.cornerRadius = imageView.frame.width / 2 // 반원
        imageView.clipsToBounds = true
        
        // 그림자
        imageView.layer.shadowColor = UIColor.red.cgColor
        imageView.layer.shadowOpacity = 0.8 // 그림자의 투명도 조절
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.layer.shadowRadius = 6
        
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 10
        
        imageView.alpha = 0.75 // 뷰의 투명도 조절
        
        self.view.addSubview(imageView)
        
        let flagImageView = UIImageView(image: UIImage(systemName: "flag"))
        flagImageView.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        flagImageView.contentMode = .scaleToFill // 이미지 비율 유지 X, 프레임에 가득 채워지게
        flagImageView.contentMode = .scaleAspectFill // 프레임 밖으로 넘쳐서 잘림
        self.view.addSubview(flagImageView)
    }


}

