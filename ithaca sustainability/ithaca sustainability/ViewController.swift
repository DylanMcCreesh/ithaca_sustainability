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
    
    var headerBackground = UILabel()
    var createPostButton = UIButton()
    var searchButton = UIButton()
    
    
                
    var loadedNewsScreen = NewsViewController()
    var loadedResourcesScreen = ResourcesViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        title = "Discussion"
        
        loadedNewsScreen.loadedDiscussionScreen = self
        loadedResourcesScreen.loadedDiscussionScreen = self
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        headerBackground.backgroundColor = .white
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerBackground)
        
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
        
        setupConstraints()
    }

    func setupConstraints() {
//         Setup the constraints for our views
        NSLayoutConstraint.activate([
            headerBackground.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.23)),
            headerBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            createPostButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.20)),
            createPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
            createPostButton.widthAnchor.constraint(equalToConstant: 300),
            createPostButton.heightAnchor.constraint(equalToConstant: 50)
            //createPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.20)),
            //searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-10),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
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
        //TODO
    }
    
    @objc func searchButtonPress(){
        //TODO
    }
}

