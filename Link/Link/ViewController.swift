//
//  ViewController.swift
//  Link
//
//  Created by 박지혜 on 5/21/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero) // (0,0)의 조그만 크기
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true // 숨김 처리
        return webView
    }()
    
    // 웹뷰에서 웹 닫기 버튼
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            self?.webView.isHidden = true
        }, for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Apple"
        linkButton.configuration = conf
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.addAction(UIAction { [weak self] _ in
            if let url = URL(string: "https://www.apple.com") {
//                UIApplication.shared.open(url)
                self?.openInWebView(url: url)
                // 사파리 뷰
//                let safariViewController = SFSafariViewController(url: url)
//                safariViewController.modalPresentationStyle = .pageSheet // 모달 뷰 스타일링
//                self?.present(safariViewController, animated: true)
            }
        }, for: .touchUpInside)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(linkButton)
        webView.addSubview(closeButton)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            closeButton.topAnchor.constraint(equalTo: webView.topAnchor, constant: -30),
            closeButton.trailingAnchor.constraint(equalTo: webView.trailingAnchor, constant: -10)
        ])
        
    }
    
    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }


}

