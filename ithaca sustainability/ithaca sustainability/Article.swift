//
//  Article.swift
//  ithaca sustainability
//
//  Created by Dylan McCreesh on 10/15/22.
//

import Foundation
import UIKit

class Article {
    var articleTitle: String?
    var articleImage: UIImage? = UIImage(named: "news1")
    var articleDate: String?
    var url: URL?
    var isIthaca: Bool? = true
    
    init(){}
}
