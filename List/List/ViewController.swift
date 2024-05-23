//
//  ViewController.swift
//  List
//
//  Created by 박지혜 on 5/22/24.
//

import UIKit

class CustomCell: UITableViewCell {
    let animalImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
            
    // 스토리보드를 위한 초기화
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        // 안에 들어가는 이미지 크기를 프레임 비율에 맞게 설정
        animalImageView.contentMode = .scaleAspectFit
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(animalImageView) // UITableViewCell이 기본으로 가지고 있는 contentView
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            animalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            animalImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            animalImageView.widthAnchor.constraint(equalToConstant: 50),
            animalImageView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(item: AnimalImage) {
        animalImageView.image = item.image
        nameLabel.text = item.name
    }
}

struct Animal {
    let name: String
}

struct AnimalCategory {
    let category: String
    let animals: [Animal]
}

struct AnimalImage {
    let name: String
    let image: UIImage
}

class ViewController: UIViewController, UITableViewDataSource {

//    let items = ["고양이", "강아지", "새", "파충류", "물고기"]
//    let categories = [
//        AnimalCategory(category: "포유류", animals: [Animal(name: "고양이"), Animal(name: "강아지")]),
//        AnimalCategory(category: "파충류", animals: [Animal(name: "거북이"), Animal(name: "도마뱀")])
//    ]
    let animals = [
        AnimalImage(name: "고양이", image: UIImage(systemName: "cat")!),
        AnimalImage(name: "강아지", image: UIImage(systemName: "dog")!),
        AnimalImage(name: "토끼", image: UIImage(systemName: "hare")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
//        let tableView = UITableView(frame: view.bounds, style: .insetGrouped) // with Category
        tableView.dataSource = self
        // 재사용 가능한 cell 등록
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 커스텀이 아닌 기본형 셀
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell") // 커스텀 셀
        view.addSubview(tableView)
        
    }
    
    // MARK: - Simple List
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell") // 있으면 재사용(재사용하지 않으면 메모리에 계속 올라감)
//        // config를 통해 의존 분리
//        var config = cell.defaultContentConfiguration()
//        config.text = items[indexPath.row]
//        cell.contentConfiguration = config
//        
//        return cell
//    }
    
    // MARK: - List with Sections
    // 카테고리 수
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return categories.count
//    }
//    
//    // 카테고리 안 개체 수
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories[section].animals.count
//    }
//    
//    // 카테고리 명
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return categories[section].category
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell") // 있으면 재사용(재사용하지 않으면 메모리에 계속 올라감)
//        // config를 통해 의존 분리
//        var config = cell.defaultContentConfiguration()
//        config.text = categories[indexPath.section].animals[indexPath.row].name
//        cell.contentConfiguration = config
//        
//        return cell
//    }
    
    // MARK: - List with Images
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        var config = cell.defaultContentConfiguration()
//        config.text = animals[indexPath.row].name
//        config.image = animals[indexPath.row].image
//        cell.contentConfiguration = config
        let animal: AnimalImage = animals[indexPath.row]
        cell.configure(item: animal)
        return cell
    }
}

