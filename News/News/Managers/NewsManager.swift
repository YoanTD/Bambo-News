//
//  NewsManager.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 17/11/20.
//

import Foundation
import Alamofire




struct NewsManager {
    let apiKeyValue: String = "cdcf259d1708429f862232d9c91389f4"
    
    
    
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
    
    func fetchEverything(query: String,
                         success: @escaping (ArticleList)-> () ) {
        
        let parameters = [
            EndpointParameter.query.rawValue : query,
            EndpointParameter.apiKey.rawValue : apiKeyValue
        ]
        AF.request(Endpoints.everything.url, parameters: parameters)
            .validate()
            .responseDecodable(of:ArticleList.self) { (response) in
                guard let bitcoinList : ArticleList = response.value else {
                    
                    return
                }
                success(bitcoinList)
                print(bitcoinList.totalResults)
                
                
                for btc in  bitcoinList.articles {
                    let btcDescrip : String = " ## \(btc.author) in \(btc.title)\n\n"
                    print(btcDescrip)
                    success(bitcoinList)
                }
            }
    }
    
    func fetchSources(success: @escaping (SourcesList)-> () ) {
        
        let parameters = [
            EndpointParameter.apiKey.rawValue : apiKeyValue]
        AF.request(Endpoints.sources.url , parameters: parameters)
            .validate()
            .responseDecodable(of: SourcesList.self) { (response) in
                guard let succesListFull : SourcesList = response.value else {
                    return
                }
                success(succesListFull)
                
            }
    }
    
    func fetchMovies(succes : @escaping (MoviesList)-> () ) {
        AF.request(Endpoints.movies.url)
            .validate()
            .responseDecodable(of: MoviesList.self) { (response) in
                guard let succesMovies: MoviesList = response.value else {
                    return
                }
                print("##### he llegado")
                succes(succesMovies)
            }
    }
}




