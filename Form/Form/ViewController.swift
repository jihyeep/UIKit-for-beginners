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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let formOneLabel = UILabel()
    let formOneTextField = UITextField()
    let formTwoLabel = UILabel()
    let formTwoTextField = UITextField()
    let resultLabelOne = UILabel()
    let resultLabelTwo = UILabel()
    
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
        2
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
            return "폼 #2"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func setupFormOne() {
        formOneLabel.text = "이것은 첫 번째 폼입니다"
        formOneLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formOneLabel)
        
        formOneTextField.borderStyle = .roundedRect
        formOneTextField.placeholder = "여기에 입력하세요"
        formOneTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formOneTextField)
        
        NSLayoutConstraint.activate([
            formOneLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            formOneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formOneTextField.topAnchor.constraint(equalTo: formOneLabel.bottomAnchor, constant: 10),
            formOneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupFormTwo() {
        formTwoLabel.text = "이것은 두 번째 폼입니다"
        formTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formTwoLabel)
        
        formTwoTextField.borderStyle = .roundedRect
        formTwoTextField.placeholder = "여기에 입력하세요"
        formTwoTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formTwoTextField)
        
        NSLayoutConstraint.activate([
            formTwoLabel.topAnchor.constraint(equalTo: formOneTextField.bottomAnchor, constant: 20),
            formTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formTwoTextField.topAnchor.constraint(equalTo: formTwoLabel.bottomAnchor, constant: 10),
            formTwoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupResults() {
        resultLabelOne.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabelOne)
        
        resultLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabelTwo)
        
        NSLayoutConstraint.activate([
            resultLabelOne.topAnchor.constraint(equalTo: formTwoTextField.bottomAnchor, constant: 20),
            resultLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabelTwo.topAnchor.constraint(equalTo: resultLabelOne.bottomAnchor, constant: 10),
            resultLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
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

