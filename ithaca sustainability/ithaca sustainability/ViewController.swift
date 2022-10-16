//
//  ViewController.swift
//  practiceTableView
//
//  Created by Dylan McCreesh on 10/14/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var headerBackground = UILabel()
    var createPostButton = UIButton()
    var searchButton = UIButton()
    
    let refreshControl = UIRefreshControl()
    var tableView = UITableView()
    let reuseIdentifier = "discussionCellReuse"
    var posts : [Post] = [Post(), Post()]
                
    var loadedNewsScreen = NewsViewController()
    var loadedResourcesScreen = ResourcesViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        posts[0].postAuthor = "Dylan McCreesh"
        posts[0].postDescription = "I'm not from Tompkins county/the Ithaca area. Where I grew up, you couldn't recycle glass. I was wondering whether glass is an acceptable recyclable here in Ithaca. Thank you!"
        posts[0].postTitle = "Recycling Glass in Ithaca"
        var list0 = [Comment(), Comment()]
        list0[0].commentAuthor = "Marya Kim"
        list0[0].commentBody = "Great question! Yes, glass is an accpetable recyclable here in Ithaca."
        list0[1].commentAuthor = "Emily Penna"
        list0[1].commentBody = "Yeah, you can! Funnily enough, I had the same question when I moved here."
        posts[0].comments = list0
        
        posts[1].postAuthor = "Annesh Ghosh Dastidar"
        posts[1].postDescription = "I'm not sure where/how I should be disposing of my battery waste."
        posts[1].postTitle = "Proper battery disposal in Ithaca?"
        var list1 = [Comment()]
        list1[0].commentAuthor = "Emily Penna"
        list1[0].commentBody = "I was wondering about this as well! Does anyone know?"
        posts[1].comments = list1
        
        loadedNewsScreen.loadedDiscussionScreen = self
        loadedResourcesScreen.loadedDiscussionScreen = self
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        headerBackground.backgroundColor = .white
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerBackground)
        
        titleLabel.text = "Discussion"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Ithaca Sustainability Q&A"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        createPostButton.setBackgroundImage(UIImage(named:"create_post_button"), for: .normal)
        createPostButton.backgroundColor = .white
        //createPostButton.frame.size = CGSize(width: 40.0, height: 20.0)
        createPostButton.translatesAutoresizingMaskIntoConstraints = false
        createPostButton.addTarget(self, action: #selector(createPostButtonPress), for: .touchUpInside)
        view.addSubview(createPostButton)
        
        searchButton.setBackgroundImage(UIImage(named:"search_button"), for: .normal)
        searchButton.backgroundColor = .white
        //searchButton.frame.size = CGSize(width: 40.0, height: 20.0)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchButtonPress), for: .touchUpInside)
        view.addSubview(searchButton)
        
        
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
        tableView.register(DiscussionTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
            headerBackground.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.25)),
            headerBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -(view.frame.height * 0.02)),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.002),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            createPostButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.22)),
            createPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:15),
            createPostButton.widthAnchor.constraint(equalToConstant: 300),
            createPostButton.heightAnchor.constraint(equalToConstant: 50)
            //createPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.22)),
            //searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-15),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.05),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 0.05)),
            tableView.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: navBarBackground.topAnchor, constant: -2)
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
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedNewsScreen)
    }
    
    @objc func resourcesButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedResourcesScreen)
    }
    
    @objc func createPostButtonPress(){
        let createPostScreen = CreatePostViewController()
        createPostScreen.loadedDiscussionScreen = self
        self.view.window?.rootViewController = UINavigationController(rootViewController: createPostScreen)
    }
    
    @objc func searchButtonPress(){
        //TODO
    }
    
    @objc func refresh(){
        //TODO
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? DiscussionTableViewCell {
                let post = posts[indexPath.row]
                cell.configure(post: post)
                cell.selectionStyle = .none
                cell.layer.backgroundColor = UIColor.clear.cgColor
                cell.backgroundColor = .clear
                return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let postScreen = PostViewController()
        postScreen.parentPost = post
        postScreen.loadedDiscussionScreen = self
        self.view.window?.rootViewController = UINavigationController(rootViewController: postScreen)
    }
}
