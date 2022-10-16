//
//  ResourceTableViewCell.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import Foundation
import UIKit

class ResourceTableViewCell: UITableViewCell {
    
    var resourceName = UILabel()
    var logo = UIImageView()
    var background = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        background.backgroundColor = .gray
        background.layer.masksToBounds = true
        background.layer.cornerRadius = 20
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        resourceName.font = .systemFont(ofSize: 16, weight: .bold)
        resourceName.textColor = .black
        resourceName.translatesAutoresizingMaskIntoConstraints = false
        resourceName.backgroundColor = .clear
        contentView.addSubview(resourceName)

        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.backgroundColor = .clear
        contentView.addSubview(logo)
        
        setupConstraints()
    }

    func configure(resource: Resource) {
        resourceName.text = resource.resourceCategory
        logo.image = resource.logo
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            resourceName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 5),
            resourceName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logo.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -5),
            logo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

