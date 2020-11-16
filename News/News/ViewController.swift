//
//  ViewController.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 16/11/20.
//

import UIKit
import  Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsersBy()
        
        
    }
    func fetchUsersBy() {
        
        
        let parameters = ["country": "us" , "apiKey": "ad744c6e7c234011ad5decae4f173e16"]
        AF.request(Endpoints.topHeadLines.url, parameters : parameters)
            .validate()
            .responseDecodable(of: ArticleList.self) { (response) in
                guard let articleList : ArticleList = response.value else {
                    print(String(describing: response.error))
                    return
                }
                print(articleList.totalResults)
                
                
                for articulo in articleList.articles {
                    let articleDescrip : String = "## \(articulo.author) in \(articulo.title)\n\n"
                print(articleDescrip)
                    
                }
                
                
            }
        
        
    }
}


//for user in userList.users {
//    let userDescription: String = "## \(user.name) lives in \(user.city)\n\n"
//    self.textLab.text.append(userDescription)
