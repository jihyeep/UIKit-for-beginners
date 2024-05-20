//
//  ViewController.swift
//  Text
//
//  Created by 박지혜 on 5/20/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // label에 padding 주기
//        let paddingView = UIView()
//        paddingView.translatesAutoresizingMaskIntoConstraints = false
//        paddingView.backgroundColor = .blue
//       
//        let label = UILabel()
//        label.text = "This is a long text that should wrap into multiple lines if it exceeds the width of the label."
//        label.text = "Stylized Text"
//        label.textColor = .yellow
//        label.backgroundColor = .red
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 17)
        
//        label.numberOfLines = 0 // 여러 줄 표시
//        label.lineBreakMode = .byWordWrapping // 경계를 넘어갈 때 단어의 줄 변경
        
        // 둥근 모서리 적용
//        label.layer.cornerRadius = 10
//        label.clipsToBounds = true
//        
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        paddingView.addSubview(label)
//        view.addSubview(paddingView)
        
        // 여러 줄 실습
//        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
//        ])
        
        // 둥근 모서리 실습
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            label.widthAnchor.constraint(equalToConstant: 200),
//            label.heightAnchor.constraint(equalToConstant: 40)
//        ])
        
        // paddin 실습
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 20),
//            label.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -20),
//            label.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -20),
//            
//            paddingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            paddingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            paddingView.widthAnchor.constraint(equalToConstant: 200),
//            paddingView.heightAnchor.constraint(equalToConstant: 100)
//        ])
        
        // MARK: - 구간별 스타일링(잘 안 씀)
        
//        let attributedString = NSMutableAttributedString(string: "Hello, World")
//        attributedString.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 20), range: NSRange(location: 0, length: 5))
//        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 7, length: 5))
//        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 12))
//        
//        let label = UILabel()
//        label.attributedText = attributedString
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(label)
//        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
//        ])
        
        // MARK: - WebView 사용
        
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false

        let htmlString = """
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body {
                    font-family: -apple-system, Helvetica, Arial, sans-serif;
                    font-size: 2rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
                .italic {
                    font-style: italic;
                }
                .blue {
                    color: blue;
                }
                .underline {
                    text-decoration: underline;
                }
            </style>
        </head>
        <body>
            <span class="italic underline">Hello,&nbsp;</span><span class="blue underline">World</span>
        </body>
        </html>
        """

        webView.loadHTMLString(htmlString, baseURL: nil)

        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}

