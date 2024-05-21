//
//  ViewController.swift
//  Picker
//
//  Created by 박지혜 on 5/21/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    let options2 = ["옵션 1", "옵션 2", "옵션 3", "옵션 4", "옵션 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pickerView)
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - UIPickerViewDelegate
    // 피커 내 옵션 타이틀명
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return options[row]
        switch component {
        case 0:
            return options[row]
        case 1:
            return options2[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected component: \(component), row: \(row)")
    }
    
    // MARK: - UIPickerViewDataSource
    // 피커 컴포넌트 수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
        2
    }
    
    // 피커 내 옵션 수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        options.count
        switch component {
        case 0:
            return options.count
        case 1:
            return options2.count
        default:
            return 0
        }
    }
    
    
}

