//
//  CommentTableViewCell.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import Foundation
import UIKit

class CommentTableViewCell: UITableViewCell {
    
    var background = UILabel()
    var authorLabel = UILabel()
    var bodyLabel = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        background.backgroundColor = .white
        background.layer.masksToBounds = true
        background.layer.cornerRadius = 20
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        bodyLabel.backgroundColor = .clear
        bodyLabel.font = .systemFont(ofSize: 16, weight: .bold)
        bodyLabel.textColor = .black
        bodyLabel.isEditable = false
        bodyLabel.isSelectable = false
        bodyLabel.isScrollEnabled = true
        bodyLabel.isUserInteractionEnabled = false
        bodyLabel.textContainer.maximumNumberOfLines = 2
        bodyLabel.textContainer.lineBreakMode = .byTruncatingTail
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bodyLabel)
        
        authorLabel.backgroundColor = .clear
        authorLabel.font = .systemFont(ofSize: 12, weight: .bold)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.textColor = .systemGray
        contentView.addSubview(authorLabel)

        setupConstraints()
    }

    func configure(comment: Comment) {
        bodyLabel.text = comment.commentBody
        authorLabel.text = comment.commentAuthor
    }

    func setupConstraints() {
        let padding: CGFloat = 15
        let labelHeight: CGFloat = 25

        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -padding),
            bodyLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: padding),
            bodyLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 5),
            bodyLabel.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: padding + 3),
            authorLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -3),
            authorLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
