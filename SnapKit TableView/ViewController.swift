//
//  ViewController.swift
//  SnapKit TableView
//
//  Created by Абай Бауржан on 23.02.2025.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let surnameLabel = UILabel()
    
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configure(with: person)
    }
    
    private func setupViews() {
        [imageView, nameLabel, surnameLabel].forEach { view.addSubview($0) }
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    func configure(with person: Person) {
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        imageView.image = UIImage(named: person.imageName)
    }
}
