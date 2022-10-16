//
//  Post.swift
//  ithaca sustainability
//
//  Created by Annesh Ghosh Dastidar on 10/15/22.
//

import Foundation

import UIKit

class Post {
    var postTitle: String?
    var postDescription: String?
    var postAuthor: String?
    var id = 0
    var comments: [Comment] = []
    
    init(){
        postTitle = "default title"
        postDescription = "default description"
        postAuthor = "default author"
        comments += [Comment(), Comment(), Comment(), Comment()]
    }
}
