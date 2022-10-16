//
//  SearchViewController.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/16/22.
//

import UIKit
import Foundation

class SearchViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var searchField = UITextField()
    var searchButton = UIButton()
    
    var repliesLabel = UILabel()
    
    var headerBackground = UILabel()
    var createPostButton = UIButton()
    
    
    let refreshControl = UIRefreshControl()
    var tableView = UITableView()
    let reuseIdentifier = "discussionCellReuse"
    var posts : [Post] = []
    var displayedPosts: [Post] = []
                
    var loadedDiscussionScreen: ViewController?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        posts = loadedDiscussionScreen!.posts
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        headerBackground.backgroundColor = .white
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerBackground)
        
        titleLabel.text = "Search"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Ithaca Sustainability Q&A"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        searchField.attributedPlaceholder = NSAttributedString(string: "Enter Search Term", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 236/255, green: 236/255, blue: 236/225, alpha: 1)])
        searchField.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.setLeftPaddingPoints(10)
        searchField.setRightPaddingPoints(10)
        view.addSubview(searchField)
        
        searchButton.setBackgroundImage(UIImage(named:"search_button2"), for: .normal)
        searchButton.backgroundColor = .clear
        //searchButton.frame.size = CGSize(width: 40.0, height: 20.0)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchButtonPress), for: .touchUpInside)
        view.addSubview(searchButton)
        
        repliesLabel.text = "Replies"
        repliesLabel.font = .systemFont(ofSize: 16, weight: .bold)
        repliesLabel.textColor = .white
        repliesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repliesLabel)
        
        
        
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
            headerBackground.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.165)),
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
            searchField.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: (view.frame.height * 0.03)),
            searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchField.widthAnchor.constraint(equalToConstant: 300),
            searchField.heightAnchor.constraint(equalToConstant: 50),
        
        ])
        
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: (view.frame.height * 0.03)),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 300),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            repliesLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: (view.frame.height * 0.03)),
            repliesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width) * 0.05),
            
        ])
        
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.05),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 0.05)),
            tableView.topAnchor.constraint(equalTo: repliesLabel.bottomAnchor, constant: (view.frame.height) * 0.03),
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
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedNewsScreen)
    }
    
    @objc func resourcesButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedResourcesScreen)
    }
    
    @objc func discussionButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!)
    }
    
    @objc func createPostButtonPress(){
        //TODO
    }
    
    @objc func searchButtonPress(){
        displayedPosts = []
        if let text = searchField.text{
            for p in posts{
                if (p.postDescription!.localizedCaseInsensitiveContains(text) || p.postTitle!.localizedCaseInsensitiveContains(text) || p.postAuthor!.localizedCaseInsensitiveContains(text)){
                    displayedPosts.append(p)
                }
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func refresh(){
        //TODO
    }
}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? DiscussionTableViewCell {
                let post = displayedPosts[indexPath.row]
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

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let postScreen = PostViewController()
        postScreen.parentPost = post
        postScreen.loadedDiscussionScreen = self.loadedDiscussionScreen!
        self.view.window?.rootViewController = UINavigationController(rootViewController: postScreen)
    }
}
