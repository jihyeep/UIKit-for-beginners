//
//  ViewController.swift
//  List
//
//  Created by 박지혜 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let items = ["고양이", "강아지", "새", "파충류", "물고기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        // 재사용 가능한 cell 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell") // 있으면 재사용(재사용하지 않으면 메모리에 계속 올라감)
        // config를 통해 의존 분리
        var config = cell.defaultContentConfiguration()
        config.text = items[indexPath.row]
        cell.contentConfiguration = config
        
        return cell
    }
    
}

