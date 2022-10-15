//
//  ArticleTableViewCell.swift
//  ithaca sustainability
//
//  Created by Dylan McCreesh on 10/15/22.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {

    var background = UILabel()
    var titleLabel = UITextView()
    var dateLabel = UILabel()
    var articleImage = UIImageView()
    var categoryTag = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear
        
        background.backgroundColor = .white
        background.layer.masksToBounds = true
        background.layer.cornerRadius = 20
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        
        categoryTag.translatesAutoresizingMaskIntoConstraints = false
        categoryTag.contentMode = .scaleAspectFit
        contentView.addSubview(categoryTag)
        
        titleLabel.backgroundColor = .clear
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.isEditable = false
        titleLabel.isSelectable = false
        titleLabel.isScrollEnabled = true
        titleLabel.isUserInteractionEnabled = false
        titleLabel.textContainer.maximumNumberOfLines = 3
        titleLabel.textContainer.lineBreakMode = .byTruncatingTail
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        dateLabel.backgroundColor = .clear
        dateLabel.font = .systemFont(ofSize: 12, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = .systemGray
        contentView.addSubview(dateLabel)

        articleImage.contentMode = .scaleAspectFit
        articleImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(articleImage)
        
        setupConstraints()
    }

    func configure(article: Article) {
        articleImage.image = article.articleImage
        categoryTag.image = UIImage(named: "global_tag_1")
        if article.isIthaca!{
            categoryTag.image = UIImage(named: "ithaca_tag_1")
        }
        titleLabel.text = article.articleTitle
        dateLabel.text = article.articleDate
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
            titleLabel.trailingAnchor.constraint(equalTo: articleImage.leadingAnchor, constant: -padding),
            titleLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: padding),
            titleLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: padding + 3),
            dateLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -3),
            dateLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            categoryTag.trailingAnchor.constraint(equalTo: articleImage.leadingAnchor),
            categoryTag.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -3),
            categoryTag.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            articleImage.heightAnchor.constraint(equalToConstant: 85),
            articleImage.widthAnchor.constraint(equalToConstant: 102),
            articleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            articleImage.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -padding)
        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
