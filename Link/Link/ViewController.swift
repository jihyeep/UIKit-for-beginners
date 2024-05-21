//
//  ViewController.swift
//  Link
//
//  Created by 박지혜 on 5/21/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero) // (0,0)의 조그만 크기
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true // 숨김 처리
        return webView
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
            }
        }, for: .touchUpInside)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(linkButton)
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }


}

