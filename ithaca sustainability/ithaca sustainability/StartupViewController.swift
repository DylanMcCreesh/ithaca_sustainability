//
//  StartupViewController.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//


import UIKit
import Foundation
import Alamofire

class StartupViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var treeImage = UIButton()
    
    var enterUsername = UITextField()
    
    var loginButton = UIButton()
    var signupButton = UIButton()
    
    /*var postTitleLabel = UILabel()
    var postTitleText = UITextField()
    
    var postDescriptionLabel = UILabel()
    var postDescriptionText = UITextView()
    
    var publishButton = UIButton()
    
    var headerBackground = UILabel()*/
    
                
    var loadedNewsScreen = NewsViewController()
    var loadedDiscussionScreen = ViewController()
    var loadedResourcesScreen = ResourcesViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        
        titleLabel.text = "App Name"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Ithaca Sustainability Q&A"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        treeImage.setBackgroundImage(UIImage(named: "white_tree"), for: .normal)
        treeImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(treeImage)
        
        //enterUsername.placeholder = "Enter Username"
        enterUsername.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 236/255, green: 236/255, blue: 236/225, alpha: 1)])
        enterUsername.textColor = .white
        enterUsername.layer.borderColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1).cgColor
        enterUsername.layer.borderWidth = 1.5
        enterUsername.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        enterUsername.translatesAutoresizingMaskIntoConstraints = false
        enterUsername.setLeftPaddingPoints(10)
        enterUsername.setRightPaddingPoints(10)
        view.addSubview(enterUsername)
        
        loginButton.setBackgroundImage(UIImage(named: "login"), for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonPress), for: .touchUpInside)
        view.addSubview(loginButton)
        
        signupButton.setBackgroundImage(UIImage(named: "signup"), for: .normal)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.addTarget(self, action: #selector(signupButtonPress), for: .touchUpInside)
        view.addSubview(signupButton)
        
        
        
        setupConstraints()
    }

    func setupConstraints() {
//         Setup the constraints for our views
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -(view.frame.height * 0.02)),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.frame.height * 0.002),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            treeImage.widthAnchor.constraint(equalToConstant: 250),
            treeImage.heightAnchor.constraint(equalToConstant: 250),
            treeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            treeImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
        
        ])
        
        NSLayoutConstraint.activate([
            enterUsername.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height * 0.25)),
            enterUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterUsername.widthAnchor.constraint(equalToConstant: 300),
            enterUsername.heightAnchor.constraint(equalToConstant: 50),

        ])
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: enterUsername.bottomAnchor, constant: 50),
            signupButton.leadingAnchor.constraint(equalTo: enterUsername.leadingAnchor),
            signupButton.widthAnchor.constraint(equalToConstant: 140),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: enterUsername.bottomAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: enterUsername.trailingAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 140),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
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
    
    @objc func discussionButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen)
    }
    
    @objc func publishButtonPress(){
        //TODO
    }
    
    @objc func loginButtonPress(){
        
    }
    
    @objc func signupButtonPress(){
        
    }
    
    @objc func refresh(){
        //TODO
    }
}

