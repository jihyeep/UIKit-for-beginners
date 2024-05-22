//
//  ViewController.swift
//  Gesture
//
//  Created by 박지혜 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {
    var minSize: CGSize = CGSize(width: 100, height: 100)
    var maxSize: CGSize = CGSize(width: 300, height: 300)

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
        rectangle.addGestureRecognizer(longPressGesture)
        
        // Pinch
//        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
//        imageView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
//        imageView.isUserInteractionEnabled = true
//        
//        view.addSubview(imageView)
//        
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
//        imageView.addGestureRecognizer(pinchGesture)
        
        // Rotation
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: view.bounds.midX-100, y: view.bounds.midY-100, width: 200, height: 200) // CGRect의 x,y는 좌측 상단에서 시작함
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)

        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        imageView.addGestureRecognizer(rotationGesture)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }
    
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        print("\(sender.state)")
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        // 단순 PinchGesture
//        print("\(sender.scale)")
//        if let view = sender.view {
//            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale) // 손을 대는 순간 1
//        }
        
        // 최대/최소 크기 지정 방법 1 - 확 커지면 최대를 넘어가는 문제 발생
//        guard let view = sender.view else { return }
//        
//        let currentScale = sqrt(view.transform.a * view.transform.a + view.transform.c * view.transform.c)
//        if sender.scale < 1.0  {
//            if currentScale > 0.8 {
//                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
//            }
//        } else {
//            if currentScale < 1.2 {
//                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
//            }
//        }
        
        // 최대/최소 크기 지정 방법 2
        guard let viewToResize = sender.view else { return }
        
        // 현재 뷰의 크기
        let currentSize = viewToResize.frame.size
        
        // 핀치 제스처 인식기의 scale 속성을 사용하여 크기 변경
        let newWidth = currentSize.width * sender.scale
        let newHeight = currentSize.height * sender.scale
        
        // 최소 및 최대 크기 제한 적용
        let clampedWidth = max(minSize.width, min(newWidth, maxSize.width))
        let clampedHeight = max(minSize.height, min(newHeight, maxSize.height))
        
        // 크기 변경 적용
        viewToResize.bounds.size = CGSize(width: clampedWidth, height: clampedHeight)
        
        // 스케일 초기화
        sender.scale = 1.0
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
        print("\(sender.rotation)")
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }

}

