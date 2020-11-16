//
//  Article.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 16/11/20.
//

import Foundation
import Alamofire

struct Article : Decodable {
    var source : ArticleSource
    var author: String?
    var title: String
    var description: String?
    var url : String
    var urlToImage: String?
    var publishedAT : String?
    var content: String?
}
