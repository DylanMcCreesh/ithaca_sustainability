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
                
    var loadedNewsScreen = NewsViewController()
    var loadedResourcesScreen = ResourcesViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        title = "Discussion"
        
        loadedNewsScreen.loadedDiscussionScreen = self
        loadedResourcesScreen.loadedDiscussionScreen = self
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
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
}

