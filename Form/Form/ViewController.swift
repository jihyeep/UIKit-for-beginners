//
//  ViewController.swift
//  Form
//
//  Created by 박지혜 on 5/23/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.rowHeight = 80 // 행 높이 설정
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let formOneLabel = UILabel()
    let formOneTextField = UITextField()
    let formOneSwitch = UISwitch()
    let formTwoLabel = UILabel()
    let formTwoTextField = UITextField()
    let resultLabelOne = UILabel()
    let resultLabelTwo = UILabel()
    let resultButton = UIButton(type: .system)
    
    lazy var textFieldAction = UIAction(handler: textFieldDidChange)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
//        setupFormOne()
//        setupFormTwo()
//        setupResults()
        
        // TextField 핸들링 방법 1
        //        formOneTextField.addAction(UIAction { [weak self] _ in
        //            self?.resultLabelOne.text = "폼 #1 = \(self?.formOneTextField.text ?? "")"
        //        }, for: .editingChanged)
        //        formTwoTextField.addAction(UIAction { [weak self] _ in
        //            self?.resultLabelTwo.text = "폼 #2 = \(self?.formTwoTextField.text ?? "")"
        //        }, for: .editingChanged)
        
        // TextField 핸들링 방법 2
//        formOneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        formTwoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    // TextField 핸들링 방법 3(액션 개체 생성) - 강한 참조가 일어날 수 있기에 메모리 해제가 필요함
    override func viewIsAppearing(_ animated: Bool) {
        formOneTextField.addAction(textFieldAction, for: .editingChanged)
        formTwoTextField.addAction(textFieldAction, for: .editingChanged)
    }
    // 메모리 해제
    override func viewWillDisappear(_ animated: Bool) {
        formOneTextField.removeAction(textFieldAction, for: .editingChanged)
        formTwoTextField.removeAction(textFieldAction, for: .editingChanged)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return formOneSwitch.isOn ? 2 : 0
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    // Section 이름 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            return "결과"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "폼 #1"
        case 1:
            return formOneSwitch.isOn ? "폼 #2" : nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.contentView.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        switch indexPath.section {
        case 0:
            setupFormOne(view: cell.contentView, indexPath: indexPath)
        case 1:
            setupFormTwo(view: cell.contentView, indexPath: indexPath)
        case 2:
            setupResults(view: cell.contentView, indexPath: indexPath)
        default:
            break
        }
        return cell
    }
    
    func setupFormOne(view: UIView, indexPath: IndexPath) { // view는 cell의 contentView
        if indexPath.section != 0 { return } // 첫 번째 섹션
        switch indexPath.row {
        case 0: // 첫 번째 섹션 중 첫 번째 행
            formOneLabel.text = "이것은 첫 번째 폼입니다"
            formOneLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formOneLabel)
            NSLayoutConstraint.activate([
                formOneLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formOneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        case 1:
            formOneTextField.borderStyle = .roundedRect
            formOneTextField.placeholder = "여기에 입력하세요"
            formOneTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formOneTextField)
            NSLayoutConstraint.activate([
                formOneTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formOneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                formOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        case 2:
            formOneSwitch.addAction(UIAction { [weak self] _ in
                self?.tableView.reloadData()
            }, for: .valueChanged)
            
            formOneSwitch.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formOneSwitch)
            NSLayoutConstraint.activate([
                formOneSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                formOneSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        default:
            break
        }
    }
    
    func setupFormTwo(view: UIView, indexPath: IndexPath) {
        if indexPath.section != 1 { return }
        
        switch indexPath.row {
        case 0:
            formTwoLabel.text = "이것은 두 번째 폼입니다"
            formTwoLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formTwoLabel)
            NSLayoutConstraint.activate([
                formTwoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])

        case 1:
            formTwoTextField.borderStyle = .roundedRect
            formTwoTextField.placeholder = "여기에 입력하세요"
            formTwoTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formTwoTextField)
            NSLayoutConstraint.activate([
                formTwoTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formTwoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                formTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        case 2:
            resultButton.setTitle("클릭하세요.", for: .normal)
            resultButton.isEnabled = formOneSwitch.isOn
            
            resultButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(resultButton)
            NSLayoutConstraint.activate([
                resultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        default:
            break
        }
    }
    
    func setupResults(view: UIView, indexPath: IndexPath) {
        if indexPath.section != 2 { return }
        switch indexPath.row {
        case 0:
            resultLabelOne.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(resultLabelOne)
            NSLayoutConstraint.activate([
                resultLabelOne.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                resultLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
            
        case 1:
            resultLabelTwo.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(resultLabelTwo)
            NSLayoutConstraint.activate([
                resultLabelTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                resultLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
        default:
            break
        }
    }
    
    // MARK: - TextField 핸들링 방법 2
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == formOneTextField {
            resultLabelOne.text = "폼 #1 = \(textField.text ?? "")"
        } else {
            resultLabelTwo.text = "폼 #2 = \(textField.text ?? "")"
        }
    }
    
    // MARK: - TextField 핸들링 방법 3
    func textFieldDidChange(_ action: UIAction) {
        guard let textField = action.sender as? UITextField else { return }
        
        if textField == formOneTextField {
            resultLabelOne.text = "폼 #1 = \(textField.text ?? "")"
        } else {
            resultLabelTwo.text = "폼 #2 = \(textField.text ?? "")"
        }
    }
    
}

