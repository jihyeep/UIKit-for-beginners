//
//  ViewController.swift
//  Menu
//
//  Created by 박지혜 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Options"
        menuButton.configuration = conf
        menuButton.addAction(UIAction { [weak self] _ in
            self?.showMenu(sourceView: menuButton)
        }, for: .touchUpInside)
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func showMenu(sourceView: UIView) {
        let alert = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open", style: .default) { _ in
            self.showMessage("Open chosen")
        })
        // 액션 추가
        alert.addAction(UIAlertAction(title: "Find", style: .default, handler: { _ in self.showMessage("Find chosen") }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in self.showMessage("Delete chosen") }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // 서브 메뉴
        alert.addAction(UIAlertAction(title: "Submenu", style: .default, handler: { [weak self] _ in
            self?.showSubmenu(sourceView: sourceView)
        }))
        
        // 뷰 위에 popover해서 그림
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = [.down] // 말풍선
        }
        present(alert, animated: true)
    }
    
    // 서브 메뉴
    func showSubmenu(sourceView: UIView) {
        let submenuAlert = UIAlertController(title: "Submenu", message: nil, preferredStyle: .actionSheet)
        submenuAlert.addAction(UIAlertAction(title: "Copy Format", style: .default, handler: { _ in self.showMessage("Copy format chosen") }))
        submenuAlert.addAction(UIAlertAction(title: "Paste Format", style: .default, handler: { _ in self.showMessage("Paste format chosen") }))
        submenuAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // 아이패드에서는 팝오버 형태로 서브메뉴 표시 -> 아이폰에서는 액션시트
        if let popoverController = submenuAlert.popoverPresentationController {
            popoverController.sourceView = sourceView // 팝오버가 나타날 때 menuButton 기준(menuButton 크기와는 상관없음)
            popoverController.sourceRect = sourceView.bounds // 팝오버의 기준 위치가 menuButton의 전체 영역
            popoverController.permittedArrowDirections = [.up]
        }

        present(submenuAlert, animated: true, completion: nil)
    }
    
    func showMessage(_ message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}
