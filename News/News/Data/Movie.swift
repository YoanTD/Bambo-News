//
//  movie.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 23/11/20.
//

import Foundation
import Alamofire

struct Movie: Decodable {
    var title: String
    var releaseYear : String
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseYear = "release_year"
        
        
    }
}


