//
//  ReplyViewController.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import UIKit
import Foundation

class ReplyViewController: UIViewController {
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    var postTitleLabel = UILabel()
    var postTitleText = UITextField()
    
    var replyAuthorLabel = UILabel()
    var replyAuthorText = UITextField()
    
    var replyLabel = UILabel()
    var replyText = UITextView()
    
    var replyButton = UIButton()
    
    var postDescriptionLabel = UILabel()
    var postDescriptionText = UITextView()
    
    var publishButton = UIButton()
    
    var headerBackground = UILabel()
    
    var parentPost: Post?
    
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
        
        titleLabel.text = "Reply"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Ithaca Sustainability Q&A"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        replyAuthorLabel.text = "Name"
        replyAuthorLabel.font = .systemFont(ofSize: 18, weight: .bold)
        replyAuthorLabel.textColor = .white
        replyAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(replyAuthorLabel)
        
        //postTitleText.placeholder = "Enter Post Title"
        replyAuthorText.attributedPlaceholder = NSAttributedString(string: "Enter Your Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 236/255, green: 236/255, blue: 236/225, alpha: 1)])
        replyAuthorText.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        replyAuthorText.translatesAutoresizingMaskIntoConstraints = false
        replyAuthorText.setLeftPaddingPoints(10)
        replyAuthorText.setRightPaddingPoints(10)
        view.addSubview(replyAuthorText)

        
        replyLabel.text = "Reply"
        replyLabel.font = .systemFont(ofSize: 18, weight: .bold)
        replyLabel.textColor = .white
        replyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(replyLabel)
        
        replyText.translatesAutoresizingMaskIntoConstraints = false
        replyText.font = .systemFont(ofSize: 18, weight: .regular)
        replyText.backgroundColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 0.25)
        view.addSubview(replyText)
        
        replyButton.setBackgroundImage(UIImage(named:"add_reply"), for: .normal)
        replyButton.backgroundColor = .clear
        replyButton.translatesAutoresizingMaskIntoConstraints = false
        replyButton.addTarget(self, action: #selector(replyButtonPress), for: .touchUpInside)
        view.addSubview(replyButton)
        
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
            replyAuthorLabel.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: view.frame.height * 0.025),
            replyAuthorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            replyAuthorText.topAnchor.constraint(equalTo: replyAuthorLabel.bottomAnchor, constant: view.frame.height * 0.01),
            replyAuthorText.leadingAnchor.constraint(equalTo: replyAuthorLabel.leadingAnchor),
            replyAuthorText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            replyAuthorText.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            replyLabel.topAnchor.constraint(equalTo: replyAuthorText.bottomAnchor, constant: view.frame.height * 0.025),
            replyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            replyText.topAnchor.constraint(equalTo: replyLabel.bottomAnchor, constant: view.frame.height * 0.01),
            replyText.leadingAnchor.constraint(equalTo: replyLabel.leadingAnchor),
            replyText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            replyText.bottomAnchor.constraint(equalTo: replyButton.topAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            replyButton.bottomAnchor.constraint(equalTo: navBarBackground.topAnchor, constant: -10),
            replyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            replyButton.widthAnchor.constraint(equalToConstant: 300),
            replyButton.heightAnchor.constraint(equalToConstant: 50),
        
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
    
    @objc func replyButtonPress(){
        if let author = replyAuthorText.text, let text = replyText.text {
            if (author.count > 50 || text.count > 100 || author.count == 0 || text.count == 0 ){
                showAlert()
            }
            else{
                let myDict = ["post_id": parentPost!.id, "author": author, "text": text] as! [String:Any]
                NetworkManager.postReply(params: myDict, id: parentPost!.id)
                sendBack()
            }
        }
        else{
            showAlert()
        }
    }
    
    func sendBack(){
        let alert = UIAlertController(title: "Thanks", message: "Your reply has been added!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            self.loadedDiscussionScreen!.refresh()
            self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!)
            return })
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Try Again!", message: "You must provide a title (<=100 characters) and a name (<=50 characters)!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            return })
        present(alert, animated: true, completion: nil)
    }
}
