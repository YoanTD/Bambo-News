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
    var publishedAt : String
    var content: String?
    
    var publishedAtFormatted: String {

            let dateFormatter = DateFormatter()

            dateFormatter.locale = Locale(identifier: "en_US_POSIX")

            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

            if let date = dateFormatter.date(from: publishedAt) {

                let dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "dd-MMM-YY"

                return dateFormatter.string(from: date)

            } else {

                return publishedAt

            }

        
    
        
    
    
    }
}

