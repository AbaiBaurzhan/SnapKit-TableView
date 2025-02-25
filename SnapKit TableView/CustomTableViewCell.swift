//
//  CustomTableViewCell.swift
//  SnapKit TableView
//
//  Created by Абай Бауржан on 24.02.2025.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let surnameLabel = UILabel()
    let personImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
           contentView.addSubview(personImageView)
           contentView.addSubview(nameLabel)
           contentView.addSubview(surnameLabel)

           personImageView.contentMode = .scaleAspectFit
           personImageView.layer.cornerRadius = 30
           personImageView.clipsToBounds = true
       }

       func configure(with person: Person, isEven: Bool) {
           nameLabel.text = person.name
           surnameLabel.text = person.surname
           personImageView.image = UIImage(named: person.imageName)

           personImageView.snp.remakeConstraints { make in
               if isEven {
                   make.left.equalToSuperview().offset(16)
               } else {
                   make.right.equalToSuperview().offset(-16)
               }
               make.centerY.equalToSuperview()
               make.width.height.equalTo(100)
           }

           nameLabel.snp.remakeConstraints { make in
               if isEven {
                   make.left.equalTo(personImageView.snp.right).offset(25)
               } else {
                   make.right.equalTo(personImageView.snp.left).offset(-50)
               }
               make.top.equalToSuperview().offset(20)
           }

           surnameLabel.snp.remakeConstraints { make in
               make.top.equalTo(nameLabel.snp.bottom).offset(8)
               make.left.equalTo(nameLabel)
           }
       }
   }
