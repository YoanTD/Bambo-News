//
//  ArtricleList.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 16/11/20.
//

import Foundation
import Alamofire

struct ArticleList : Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
}



