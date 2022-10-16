//
//  DiscussionTableViewCell.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import Foundation
import UIKit

class DiscussionTableViewCell: UITableViewCell {
    
    var background = UILabel()
    var authorLabel = UILabel()
    var titleLabel = UITextView()
    var numRepliesLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        background.backgroundColor = .white
        background.layer.masksToBounds = true
        background.layer.cornerRadius = 20
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        titleLabel.backgroundColor = .clear
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.isEditable = false
        titleLabel.isSelectable = false
        titleLabel.isScrollEnabled = true
        titleLabel.isUserInteractionEnabled = false
        titleLabel.textContainer.maximumNumberOfLines = 2
        titleLabel.textContainer.lineBreakMode = .byTruncatingTail
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        authorLabel.backgroundColor = .clear
        authorLabel.font = .systemFont(ofSize: 12, weight: .bold)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.textColor = .systemGray
        contentView.addSubview(authorLabel)

        numRepliesLabel.backgroundColor = .clear
        numRepliesLabel.font = .systemFont(ofSize: 12, weight: .bold)
        numRepliesLabel.translatesAutoresizingMaskIntoConstraints = false
        numRepliesLabel.textColor = .systemGray
        contentView.addSubview(numRepliesLabel)
        
        setupConstraints()
    }

    func configure(post: Post) {
        titleLabel.text = post.postTitle
        authorLabel.text = post.postAuthor
        let num = post.comments.count
        numRepliesLabel.text = String(num) + " Replies"
        if (num == 1){
            numRepliesLabel.text = String(num) + " Reply"
        }
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
            titleLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -padding),
            titleLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: padding),
            titleLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            numRepliesLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: padding + 3),
            numRepliesLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -3),
            numRepliesLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -(padding + 3)),
            authorLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -3),
            authorLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
