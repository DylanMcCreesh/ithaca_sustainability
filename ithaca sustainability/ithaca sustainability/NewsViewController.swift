//
//  NewsViewController.swift
//  ithaca sustainability
//
//  Created by Dylan McCreesh on 10/14/22.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {

    var resourcesButton = UIButton()
    var discussionButton = UIButton()
    var newsButton = UIButton()
    var navBarBackground = UILabel()
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var titleBackground = UILabel()
    
    let refreshControl = UIRefreshControl()
    var tableView = UITableView()
    let reuseIdentifier = "newsCellReuse"
    var articles : [Article] = []
    var ithacaArticles : [Article] = []
    var globalArticles: [Article] = []

    let isoFormatter = ISO8601DateFormatter()
    let realDate: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MM/dd"
        df.locale = Locale(identifier: "en_US_POSIX")
        return df
    }()
    
    var loadedDiscussionScreen: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 219/255, green: 227/255, blue: 217/255, alpha: 1)
        isoFormatter.formatOptions = [.withInternetDateTime]

        
        titleBackground.backgroundColor = .white
        titleBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleBackground)
        
        titleLabel.text = "News"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel.text = "Recent Developments"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .bold)
        descriptionLabel.textColor = UIColor(red: 118/255, green: 158/255, blue: 125/225, alpha: 1)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)

        navBarBackground.backgroundColor = .white
        navBarBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarBackground)
        
        resourcesButton.setBackgroundImage(UIImage(named: "resources1"), for: .normal)
        resourcesButton.backgroundColor = .white
        resourcesButton.addTarget(self, action: #selector(resourcesButtonPress), for: .touchUpInside)
        resourcesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resourcesButton)
        
        discussionButton.setBackgroundImage(UIImage(named: "home1"), for: .normal)
        discussionButton.backgroundColor = .white
        discussionButton.addTarget(self, action: #selector(discussionButtonPress), for: .touchUpInside)
        discussionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(discussionButton)
        
        newsButton.setBackgroundImage(UIImage(named:"news2"), for: .normal)
        newsButton.backgroundColor = .white
        newsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newsButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        refreshControl.beginRefreshing()
        self.getGlobalArticleData()
        
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
    
    @objc func resourcesButtonPress(){
        self.view.window?.rootViewController = UINavigationController(rootViewController: self.loadedDiscussionScreen!.loadedResourcesScreen)
    }
    
    @objc func refresh(){
<<<<<<< Updated upstream
        //getArticleData()
=======
        getGlobalArticleData()
        getIthacaArticleData()
>>>>>>> Stashed changes
        refreshControl.endRefreshing()
    }
    
    func getGlobalArticleData() {
        NetworkManager.getGlobalNewsArticles(completion: { (data,error) in
            var articles: [String:Any] = [:]
            articles = data as! [String : Any]
<<<<<<< Updated upstream
            //self.getArticles(articleDictionary: articles)
=======
            self.getGlobalArticles(articleDictionary: articles)
>>>>>>> Stashed changes
        }, finished: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        })
    }
    
    func getGlobalArticles(articleDictionary: [String:Any]){
        globalArticles = []
        let data = articleDictionary["articles"] as! [[String:Any]]
        var limit = 20
        if data.count < limit{
            limit = data.count
        }
        var counter = 0
        if limit > 0
        {
            for i in 0...limit-1{
                var canContinue = true
                for article in globalArticles{
                    if article.articleTitle == data[i]["title"] as! String?{
                        canContinue = false
                        counter += 1
                        if limit < data.count{
                            limit += 1
                        }
                    }
                }
                if canContinue{
                    globalArticles.append(Article())
                    globalArticles[i - counter].articleTitle = data[i]["title"] as! String?
                    if let publishedAtString = data[i]["publishedAt"] as! String? {
                        if let date = isoFormatter.date(from: publishedAtString){
                            globalArticles[i - counter].articleDate = realDate.string(from: date)
                        }
                    }
                    let articleURL = data[i]["url"] as! String
                    globalArticles[i - counter].url = URL(string: articleURL)
                    if let imageURL = data[i]["urlToImage"] {
                        if imageURL is NSNull {

                        } else {
                            let data = try? Data(contentsOf: URL(string: imageURL as! String)!)
                            if let imageData = data{
                                globalArticles[i - counter].articleImage = UIImage(data: imageData)
                            }
                        }
                    }
                    if let source = data[i]["source"] as? [String: String] {
                        globalArticles[i - counter].publisher = source["name"]
                    }
                    else {
                        articles[i - counter].publisher = "Unavailible"
                        globalArticles[i - counter].publisher = "Unavailible"
                    }
                }
            }
        }
    }
    
    func getIthacaArticleData() {
        NetworkManager.getIthacaNewsArticles(completion: { (data,error) in
            var articles: [String:Any] = [:]
            articles = data as! [String : Any]
            self.getIthacaArticles(articleDictionary: articles)
        }, finished: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        })
    }
    
    func getIthacaArticles(articleDictionary: [String:Any]){
        ithacaArticles = []
        let data = articleDictionary["articles"] as! [[String:Any]]
        var limit = 20
        if data.count < limit{
            limit = data.count
        }
        var counter = 0
        if limit > 0
        {
            for i in 0...limit-1{
                var canContinue = true
                for article in ithacaArticles{
                    if article.articleTitle == data[i]["title"] as! String?{
                        canContinue = false
                        counter += 1
                        if limit < data.count{
                            limit += 1
                        }
                    }
                }
                if canContinue{
                    ithacaArticles.append(Article())
                    ithacaArticles[i - counter].articleTitle = data[i]["title"] as! String?
                    if let publishedAtString = data[i]["publishedAt"] as! String? {
                        if let date = isoFormatter.date(from: publishedAtString){
                            ithacaArticles[i - counter].articleDate = realDate.string(from: date)
                        }
                    }
                    let articleURL = data[i]["url"] as! String
                    ithacaArticles[i - counter].url = URL(string: articleURL)
                    if let imageURL = data[i]["urlToImage"] {
                        if imageURL is NSNull {

                        } else {
                            let data = try? Data(contentsOf: URL(string: imageURL as! String)!)
                            if let imageData = data{
                                ithacaArticles[i - counter].articleImage = UIImage(data: imageData)
                            }
                        }
                    }
                    if let source = data[i]["source"] as? [String: String] {
                        ithacaArticles[i - counter].publisher = source["name"]
                    }
                    else {
                        ithacaArticles[i - counter].publisher = "Unavailible"
                    }
                }
            }
        }
    }
    
}

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ArticleTableViewCell {
                let article = articles[indexPath.row]
                cell.configure(article: article)
                cell.selectionStyle = .none
                return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let thisURL = articles[indexPath.row].url{
            UIApplication.shared.open(thisURL)
        }
    }
}

