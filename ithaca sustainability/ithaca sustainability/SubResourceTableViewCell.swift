//
//  SubResourceTableViewCell.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import Foundation
import UIKit

class SubResourceTableViewCell: UITableViewCell {
    
    var subResourceName = UILabel()
    var background = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        background.backgroundColor = .white
        background.layer.masksToBounds = true
        background.layer.cornerRadius = 20
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        subResourceName.font = .systemFont(ofSize: 25, weight: .bold)
        subResourceName.textColor = .black
        subResourceName.translatesAutoresizingMaskIntoConstraints = false
        subResourceName.backgroundColor = .clear
        contentView.addSubview(subResourceName)
                
        setupConstraints()
    }

    func configure(subResource: SubResource) {
        subResourceName.text = subResource.subResourceName
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            subResourceName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 15),
            subResourceName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

