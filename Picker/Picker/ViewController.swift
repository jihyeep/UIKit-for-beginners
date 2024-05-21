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
    
    let datePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    let options2 = ["옵션 1", "옵션 2", "옵션 3", "옵션 4", "옵션 5"]
    
    // iOS에 자원이 부족하면 호출되는 함수
    override func didReceiveMemoryWarning() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pickerView)
        
//        NSLayoutConstraint.activate([
//            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        // datePicker
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.year = -1
        let oneYearAgo = Calendar.current.date(byAdding: dateComponents, to: today)
        dateComponents.year = 1
        let oneYearFromNow = Calendar.current.date(byAdding: dateComponents, to: today)
        
        datePicker.minimumDate = oneYearAgo
        datePicker.maximumDate = oneYearFromNow
        
        datePicker.addAction(UIAction { [weak self] _ in
            print("sender: \(self?.datePicker.date.formatted() ?? "N/A")")
        }, for: .valueChanged)
            
        view.addSubview(datePicker)
        
//        NSLayoutConstraint.activate([
//            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        // colorPicker
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Color Picker"
        config.cornerStyle = .capsule
        button.configuration = config
        
        button.addAction(UIAction { [weak self] _ in
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            colorPicker.supportsAlpha = false // 투명도 지원 X
            colorPicker.selectedColor = self?.view.backgroundColor ?? .white
            self?.present(colorPicker, animated: true)
            // present는 ViewController가 죽으면 어차피 죽기 때문에 weak 대신 unowned를 써도 될 듯?
        }, for: .touchUpInside)
        
        self.view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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

// MARK: - UIColorPickerViewControllerDelegate
extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        view.backgroundColor = viewController.selectedColor
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        dismiss(animated: true)
    }
}
