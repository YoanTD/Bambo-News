//
//  NewsManager.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 17/11/20.
//

import Foundation
import Alamofire


struct NewsManager {
    static let apiKeyValue: String = ""
    
    
    
    func fetchHeadLines (){
        
        let parameters = ["country": "us" , "apiKey": "ad744c6e7c234011ad5decae4f173e16"]
        AF.request(Endpoints.topHeadLines.url, parameters: parameters)
            .validate()
            .responseDecodable(of: ArticleList.self) { (response) in
                guard let articleList : ArticleList = response.value else {
                    return
                }
                
                print(articleList.totalResults)
                
                for articulo in articleList.articles {
                    let articleDescrip : String = " ## \(articulo.author) in \(articulo.title)\n\n"
                    print(articleDescrip)
                }
            }
    }
}

