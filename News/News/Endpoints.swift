//
//  Endpoints.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 16/11/20.
//

import Foundation







enum Endpoints: String {
    case topHeadLines = "https://newsapi.org/v2/top-headlines"
    case everything = "https://newsapi.org/v2/everything"
    case sources = "https://newsapi.org/v2/sources"
    case movies = "https://private-9f06db-multitest.apiary-mock.com/movies"
    
    
    var url : String { return self.rawValue}
    
}
    
enum EndpointParameter : String {
    case  country, apiKey, sources, page
    case query = "q"
    

}





