//
//  NewsViewController.swift
//  ithaca sustainability
//
//  Created by Dylan McCreesh on 10/14/22.
//

import Foundation
import UIKit

class ResourcesViewController: UIViewController {

    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var titleBackground = UILabel()
    
    
    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var loadedDiscussionScreen: ViewController?
    
    
    let refreshControl = UIRefreshControl()
    var tableView = UITableView()
    let reuseIdentifier = "resourceCellReuse"
    var resources : [Resource] = [Resource(), Resource(), Resource()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        resources[0].resourceCategory = "Clothing"
        resources[0].logo = UIImage(named: "resource_clothing")
        var list0 = [SubResource(), SubResource(), SubResource()]
        list0[0].subResourceName = "Everlane"
        list0[1].subResourceName = "Girlfriend Collective"
        list0[2].subResourceName = "BRAND"
        resources[0].subs = list0
        
        resources[1].resourceCategory = "Household"
        resources[1].logo = UIImage(named: "resource_household")
        var list1 = [SubResource(), SubResource(), SubResource()]
        list1[0].subResourceName = "Made Trade"
        list1[1].subResourceName = "Etsy"
        list1[2].subResourceName = "Parachute"
        resources[1].subs = list1
        
        resources[2].resourceCategory = "Food"
        resources[2].logo = UIImage(named: "resource_food")
        var list2 = [SubResource(), SubResource(), SubResource()]
        list2[0].subResourceName = "Nature's Path"
        list2[1].subResourceName = "Vital Farms"
        list2[2].subResourceName = "GoMacro"
        resources[2].subs = list2
        
        titleBackground.backgroundColor = .white
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleBackground)
        
        titleLabel.text = "Resources"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Collaborative Sustainability"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        navBarBackground.backgroundColor = .white
        navBarBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarBackground)
        
        resourcesButton.setBackgroundImage(UIImage(named: "resources2"), for: .normal)
        resourcesButton.backgroundColor = .white
        resourcesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resourcesButton)
        
        discussionButton.setBackgroundImage(UIImage(named: "home1"), for: .normal)
        discussionButton.backgroundColor = .white
        discussionButton.addTarget(self, action: #selector(discussionButtonPress), for: .touchUpInside)
        discussionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(discussionButton)
        
        newsButton.setBackgroundImage(UIImage(named:"news1"), for: .normal)
        newsButton.backgroundColor = .white
        newsButton.addTarget(self, action: #selector(newsButtonPress), for: .touchUpInside)
        newsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newsButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ResourceTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
            titleBackground.topAnchor.constraint(equalTo: view.topAnchor),
            titleBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleBackground.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: (view.frame.height * 0.018)),
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.05),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width * 0.05)),
            tableView.topAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: 5),
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
    
    @objc func discussionButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!)
    }
    
    @objc func newsButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedNewsScreen)
    }
    
    @objc func refresh() {
        //TODO
    }

}

extension ResourcesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ResourceTableViewCell {
                let resource = resources[indexPath.row]
                cell.configure(resource: resource)
                cell.selectionStyle = .none
                cell.layer.backgroundColor = UIColor.clear.cgColor
                cell.backgroundColor = .clear
                return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ResourcesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resource = resources[indexPath.row]
        let screen = SubResourceViewController()
        screen.parentResource = resource
        screen.loadedDiscussionScreen = self.loadedDiscussionScreen
        self.view.window?.rootViewController = UINavigationController(rootViewController: screen)
    }
}
