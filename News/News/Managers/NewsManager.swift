//
//  NewsManager.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 17/11/20.
//

import Foundation
import Alamofire


struct NewsManager {
     let apiKeyValue: String = "ad744c6e7c234011ad5decae4f173e16"
    
    
    
    func fetchHeadLines (countryID : CountryTryp,
                         succes : @escaping (ArticleList)-> () ) {
//                         failure: @escaping (APIError)-> ()) {
        
        let parameters = [
            EndpointParameter.country.rawValue : countryID.rawValue,
            EndpointParameter.apiKey.rawValue : apiKeyValue
        ]
        
        AF.request(Endpoints.topHeadLines.url, parameters: parameters)
            .validate()
            .responseDecodable(of: ArticleList.self) { (response) in
                
                guard let articleList : ArticleList = response.value else {
//                    let error: APIError = self.apiError(from: response)
//                    failure(error)
                    return
                }
                
                
            print(articleList.totalResults)
                
                
                for articulo in articleList.articles {
                    let articleDescrip : String = " ## \(articulo.author) in \(articulo.title)\n\n"
                    print(articleDescrip)
                    succes(articleList)
                }
            }
    }
}

