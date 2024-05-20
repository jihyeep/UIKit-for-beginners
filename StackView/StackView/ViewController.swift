//
//  ViewController.swift
//  StackView
//
//  Created by 박지혜 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    let toggleSwitch = UISwitch()
    let label = UILabel()
    let stepper = UIStepper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 멤버변수, 지역변수
        // self를 쓰는 이유: 지역변수와 멤버변수의 구분을 위해. 같은 이름의 지역변수가 없다면 생략가능
        //        let view = UIView()
        //        self.view.addSubview(view)
        
        // MARK: - UIStackView()
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.spacing = 10
        //        stackView.alignment = .center
        //        stackView.distribution = .fillEqually
        //
        //        let topLabel = UILabel()
        //        topLabel.text = "위"
        //        topLabel.textAlignment = .center
        //        topLabel.backgroundColor = .lightGray
        //
        //        let leftLabel = UILabel()
        //        leftLabel.text = "왼쪽"
        //        leftLabel.textAlignment = .center
        //        leftLabel.backgroundColor = .lightGray
        //
        //        let rightLabel = UILabel()
        //        rightLabel.text = "오른쪽"
        //        rightLabel.textAlignment = .center
        //        rightLabel.backgroundColor = .lightGray
        //
        //        let hStackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        //        hStackView.axis = .horizontal
        //        hStackView.spacing = 10
        //
        //        stackView.addArrangedSubview(topLabel)
        //        stackView.addArrangedSubview(hStackView)
        //
        //        view.addSubview(stackView)
        //
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        //            stackView.widthAnchor.constraint(equalToConstant: 200),
        //            stackView.heightAnchor.constraint(equalToConstant: 100)
        //        ])
        
        // MARK: - UISwitch
        //        label.text = "Switch is OFF"
        //        label.textAlignment = .center
        
        //        toggleSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        // addTarget -> addAction
        //        toggleSwitch.addAction(UIAction(handler: myToggle(action:)), for: .valueChanged)
        //        toggleSwitch.addAction(UIAction { [weak self] _ in
        //            print("valueChanged")
        //            if let isOn = self?.toggleSwitch.isOn, isOn {
        //                self?.label.text = "Switch is ON"
        //            } else {
        //                self?.label.text = "Switch is OFF"
        //            }
        //        }, for: .valueChanged)
        //
        //        let stackView = UIStackView(arrangedSubviews: [label, toggleSwitch])
        //        stackView.axis = .vertical
        //        stackView.spacing = 10
        //        stackView.alignment = .center
        //
        //        view.addSubview(stackView)
        //
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        ])
        //
        //    }
        //
        //    func myToggle(action: UIAction) {
        //        guard let toggleSwitch = action.sender as? UISwitch else {
        //            return
        //        }
        //        if toggleSwitch.isOn {
        //            label.text = "On"
        //        } else {
        //            label.text = "Off"
        //        }
        //    }
        
        //    @objc func switchChanged(_ sender: UISwitch) {
        //        if sender.isOn {
        //            label.text = "Switch is ON"
        //        } else {
        //            label.text = "Switch is OFF"
        //        }
        //    }
        
        // MARK: - UIStepper
        
        label.text = "값: 0"
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 0
        stepper.addAction(UIAction {[weak self] _ in
            self?.label.text = "값: \(self?.stepper.value ?? 0)"}, for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [label, stepper])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
}

