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
    
    var url : String { return self.rawValue}
    
}
    
enum EndpointParameter : String {
    case  country, apiKey, sources, page
    case query = "q"
    

}





