//
//  AddSubResourceViewController.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import UIKit
import Foundation

class AddSubResourceViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var brandLabel = UILabel()
    var brandText = UITextField()
    
    var urlLabel = UILabel()
    var urlText = UITextView()
    
    var publishButton = UIButton()
    
    var headerBackground = UILabel()
    
                
    var loadedDiscussionScreen: ViewController?
    
    var parentResource: Resource?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        
        
        self.navigationController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        headerBackground.backgroundColor = .white
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerBackground)
        
        titleLabel.text = "Suggest Brand"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Submit Your Suggestion"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        brandLabel.text = "Brand Name"
        brandLabel.font = .systemFont(ofSize: 18, weight: .bold)
        brandLabel.textColor = .white
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brandLabel)
        
        //postTitleText.placeholder = "Enter Post Title"
        brandText.attributedPlaceholder = NSAttributedString(string: "Enter Brand Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 236/255, green: 236/255, blue: 236/225, alpha: 1)])
        brandText.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        brandText.translatesAutoresizingMaskIntoConstraints = false
        brandText.setLeftPaddingPoints(10)
        brandText.setRightPaddingPoints(10)
        view.addSubview(brandText)
        
        urlLabel.text = "Website"
        urlLabel.font = .systemFont(ofSize: 18, weight: .bold)
        urlLabel.textColor = .white
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(urlLabel)
        
        urlText.translatesAutoresizingMaskIntoConstraints = false
        urlText.font = .systemFont(ofSize: 18, weight: .regular)
        urlText.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        view.addSubview(urlText)
        
        publishButton.setBackgroundImage(UIImage(named:"publish"), for: .normal)
        publishButton.backgroundColor = .clear
        publishButton.translatesAutoresizingMaskIntoConstraints = false
        publishButton.addTarget(self, action: #selector(publishButtonPress), for: .touchUpInside)
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
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -(view.frame.height * 0.02)),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: -view.frame.height*0.01),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: view.frame.height * 0.025),
            brandLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            brandText.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: view.frame.height * 0.01),
            brandText.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            brandText.heightAnchor.constraint(equalToConstant: 40),
            brandText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)

        ])
        
        NSLayoutConstraint.activate([
            urlLabel.topAnchor.constraint(equalTo: brandText.bottomAnchor, constant: view.frame.height * 0.025),
            urlLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            urlText.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: view.frame.height * 0.01),
            urlText.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            urlText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            urlText.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        NSLayoutConstraint.activate([
            publishButton.topAnchor.constraint(equalTo: urlText.bottomAnchor, constant: view.frame.height * 0.025),
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
    
    @objc func publishButtonPress(){
        if let text = brandText.text{
            if text != ""{
                let myDict = ["title" : text]
                print(1)
                NetworkManager.postResourceSuggestion(params: myDict)
                showAlert()
                print(2)
            }
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Thanks", message: "We appreciate your submission!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Return", style: .default) { _ in                 self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedResourcesScreen)
            return })
        present(alert, animated: true, completion: nil)
    }
}


