//
//  EditPostViewController.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import UIKit
import Foundation

class EditPostViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var postTitleLabel = UILabel()
    var postTitleText = UITextField()
    
    var postDescriptionLabel = UILabel()
    var postDescriptionText = UITextView()
    
    var publishButton = UIButton()
    
    var headerBackground = UILabel()
    
    var loadedDiscussionScreen: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        headerBackground.backgroundColor = .white
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerBackground)
        
        titleLabel.text = "Edit"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Ithaca Sustainability Q&A"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        postTitleLabel.text = "Title"
        postTitleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        postTitleLabel.textColor = .white
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postTitleLabel)
        
        postTitleText.placeholder = "Enter Post Title"
        postTitleText.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        postTitleText.translatesAutoresizingMaskIntoConstraints = false
        postTitleText.setLeftPaddingPoints(10)
        postTitleText.setRightPaddingPoints(10)
        view.addSubview(postTitleText)
        
        postDescriptionLabel.text = "Description"
        postDescriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        postDescriptionLabel.textColor = .white
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postDescriptionLabel)
        
        postDescriptionText.translatesAutoresizingMaskIntoConstraints = false
        postDescriptionText.font = .systemFont(ofSize: 18, weight: .regular)
        postDescriptionText.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        view.addSubview(postDescriptionText)
        
        publishButton.setBackgroundImage(UIImage(named:"save_button"), for: .normal)
        publishButton.backgroundColor = .clear
        publishButton.translatesAutoresizingMaskIntoConstraints = false
        publishButton.addTarget(self, action: #selector(saveButtonPress), for: .touchUpInside)
        view.addSubview(publishButton)
        
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
        
        setupConstraints()
    }

    func setupConstraints() {
//         Setup the constraints for our views
        NSLayoutConstraint.activate([
            headerBackground.bottomAnchor.constraint(equalTo: view.topAnchor, constant:(view.frame.height * 0.16)),
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
            postTitleLabel.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: view.frame.height * 0.025),
            postTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            postTitleText.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: view.frame.height * 0.01),
            postTitleText.leadingAnchor.constraint(equalTo: postTitleLabel.leadingAnchor),
            postTitleText.heightAnchor.constraint(equalToConstant: 40),
            postTitleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)

        ])
        
        NSLayoutConstraint.activate([
            postDescriptionLabel.topAnchor.constraint(equalTo: postTitleText.bottomAnchor, constant: view.frame.height * 0.025),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            postDescriptionText.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: view.frame.height * 0.01),
            postDescriptionText.leadingAnchor.constraint(equalTo: postTitleLabel.leadingAnchor),
            postDescriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            postDescriptionText.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        NSLayoutConstraint.activate([
            publishButton.topAnchor.constraint(equalTo: postDescriptionText.bottomAnchor, constant: view.frame.height * 0.025),
            publishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            publishButton.widthAnchor.constraint(equalToConstant: 300),
            publishButton.heightAnchor.constraint(equalToConstant: 50),
        
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
    
    @objc func saveButtonPress(){
        //TODO
    }
    
    @objc func refresh(){
        //TODO
    }
}



