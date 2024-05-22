//
//  ViewController.swift
//  CustomPicker
//
//  Created by 박지혜 on 5/22/24.
//
// datePicker 직접 만들기

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private lazy var customDatePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    // datePicker가 가지고 있는 날짜 데이터 만들기
    let years = [Int](2000...2050)
    let months = [Int](1...12)
    let days = [Int](1...31)
    
    var selectedYear = 0
    var selectedMonth = 0
    var selectedDay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customDatePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customDatePicker)
        
        NSLayoutConstraint.activate([
            customDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customDatePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return years.count
        case 1:
            return months.count
        case 2:
            // 윤년 설정
            if selectedMonth == 2 {
                return (((selectedYear % 4) == 0) && ((selectedYear % 100) == 0) || selectedYear % 400 == 0) ? 29 : 28
            } else if [4,6,9,11].contains(selectedMonth) {
                return 30
            } else {
                return days.count
            }
        default:
            return 0
        }
    }
    
    // MARK: - UIPickerVewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(years[row])
        case 1:
            return String(months[row])
        case 2:
            return String(days[row])
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedYear = years[row]
            pickerView.reloadComponent(2)
        case 1:
            selectedMonth = months[row]
            pickerView.reloadComponent(2)
        case 2:
            selectedDay = days[row]
        default:
            return
        }
    }

}

