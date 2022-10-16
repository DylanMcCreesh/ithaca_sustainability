//
//  PostViewController.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import UIKit
import Foundation

class PostViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    var addReplyButton = UIButton()
    
    var titleLabel = UILabel()
    var titleText = UITextView()
    
    var authorLabel = UILabel()
    var descriptionLabel = UILabel()
    var descriptionText = UITextView()
    
    var repliesLabel = UILabel()
    
    var headerBackground = UILabel()
    
    let refreshControl = UIRefreshControl()
    var tableView = UITableView()
    let reuseIdentifier = "commentCellReuse"
    var comments : [Comment] = []
    
    var parentPost = Post()
                
    var loadedDiscussionScreen: ViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        comments = parentPost.comments
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        headerBackground.backgroundColor = .white
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerBackground)
        
        titleText.text = parentPost.postTitle
        titleText.textColor = .white
        titleText.isEditable = false
        titleText.font = .systemFont(ofSize: 20, weight: .bold)
        titleText.textColor = .black
        titleText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleText)
        
        
        authorLabel.text = parentPost.postAuthor
        authorLabel.font = .systemFont(ofSize: 16, weight: .bold)
        authorLabel.textColor = UIColor(red: 113/255, green: 113/255, blue: 113/225, alpha: 1)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorLabel)
        
        
        descriptionText.text = parentPost.postDescription
        descriptionText.textColor = .white
        descriptionText.isEditable = false
        descriptionText.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionText.textColor = UIColor(red: 113/255, green: 113/255, blue: 113/225, alpha: 1)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionText)
        
        repliesLabel.text = "Replies"
        repliesLabel.font = .systemFont(ofSize: 16, weight: .bold)
        repliesLabel.textColor = UIColor(red: 113/255, green: 113/255, blue: 113/225, alpha: 1)
        repliesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repliesLabel)
        
        addReplyButton.setBackgroundImage(UIImage(named: "add_reply"), for: .normal)
        addReplyButton.backgroundColor = .clear
        addReplyButton.addTarget(self, action: #selector(addReplyButtonPress), for: .touchUpInside)
        addReplyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addReplyButton)
        
        navBarBackground.backgroundColor = .white
        navBarBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarBackground)
        
        resourcesButton.setBackgroundImage(UIImage(named: "resources1"), for: .normal)
        resourcesButton.backgroundColor = .white
        resourcesButton.addTarget(self, action: #selector(resourcesButtonPress), for: .touchUpInside)
        resourcesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resourcesButton)
        
        discussionButton.setBackgroundImage(UIImage(named: "home2"), for: .normal)
        discussionButton.backgroundColor = .white
        discussionButton.addTarget(self, action: #selector(discussionButtonPress), for: .touchUpInside)
        discussionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(discussionButton)
        
        newsButton.setBackgroundImage(UIImage(named:"news1"), for: .normal)
        newsButton.backgroundColor = .white
        newsButton.translatesAutoresizingMaskIntoConstraints = false
        newsButton.addTarget(self, action: #selector(newsButtonPress), for: .touchUpInside)
        view.addSubview(newsButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        //refreshControl.beginRefreshing()
        
        setupConstraints()
    }

    func setupConstraints() {
//         Setup the constraints for our views
        NSLayoutConstraint.activate([
            headerBackground.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.30)),
            headerBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -(view.frame.height * 0.02)),
            titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleText.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: view.frame.height * 0.002),
            authorLabel.leadingAnchor.constraint(equalTo: titleText.leadingAnchor, constant: 4.5),
        ])
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: view.frame.height * 0.002),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            //descriptionText.widthAnchor.constraint(equalToConstant: 600),
            descriptionText.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        //Todo Replies label
        NSLayoutConstraint.activate([
            repliesLabel.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: view.frame.height * 0.01),
            repliesLabel.leadingAnchor.constraint(equalTo: titleText.leadingAnchor, constant: 4.5),
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.05),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 0.05)),
            tableView.topAnchor.constraint(equalTo: repliesLabel.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: addReplyButton.topAnchor, constant: -2)
        ])
        
        NSLayoutConstraint.activate([
            addReplyButton.bottomAnchor.constraint(equalTo: navBarBackground.topAnchor, constant: -20),
            addReplyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReplyButton.widthAnchor.constraint(equalToConstant: 300),
            addReplyButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        NSLayoutConstraint.activate([
            navBarBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            navBarBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBarBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarBackground.topAnchor.constraint(equalTo: discussionButton.topAnchor, constant: -(view.frame.height * 0.018)),
        ])
        
        NSLayoutConstraint.activate([
            resourcesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            resourcesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.height * 0.05625),
            resourcesButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05625),
            resourcesButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05625),
        ])
        
        NSLayoutConstraint.activate([
            discussionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            discussionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            discussionButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05625),
            discussionButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05625),
        ])
        
        NSLayoutConstraint.activate([
            newsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            newsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.height * 0.05625)),
            newsButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05625),
            newsButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05625),
        ])
        
        
        
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    @objc func newsButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedNewsScreen)
    }
    
    @objc func resourcesButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedResourcesScreen)
    }
    
    @objc func discussionButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!)
    }
    
    @objc func addReplyButtonPress(){
        let screen = ReplyViewController()
        screen.loadedDiscussionScreen = self.loadedDiscussionScreen
        screen.parentPost = self.parentPost
        self.view.window?.rootViewController = UINavigationController(rootViewController: screen)
    }
    
    @objc func refresh(){
        //TODO
    }
}

extension PostViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CommentTableViewCell {
                let comment = comments[indexPath.row]
                cell.configure(comment: comment)
                cell.selectionStyle = .none
                cell.layer.backgroundColor = UIColor.clear.cgColor
                cell.backgroundColor = .clear
                return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

