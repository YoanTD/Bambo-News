//
//  DetailViewController.swift
//  News
//
//  Created by Yoan Tarrillo diaz on 18/11/20.
//

import UIKit
import AlamofireImage
import Alamofire


class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleOut: UILabel!
    
    
    @IBOutlet weak var authorOut: UILabel!
    
    @IBOutlet weak var publiOut: UILabel!
    
    @IBOutlet weak var urlToImageOut: UIImageView!
    
    
    @IBOutlet weak var descriptionOut: UITextView!
    
    
    @IBAction func safariUrl(_ sender: Any) {
        guard let article : Article = NewsViewModel.selectedArticle ,
        let url = URL(string: article.url) else { return }
        UIApplication.shared.open(url)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuewView()
        
        self.title = NewsViewModel.selectedArticle?.title
        
        guard let article: Article = NewsViewModel.selectedArticle else { return }
        
    }
    
    func configuewView() {
        guard let article: Article = NewsViewModel.selectedArticle else  { return }
        descriptionOut.text = article.description
        titleOut.text = article.title
        authorOut.text = article.author ?? "_"
        publiOut.text = article.publishedAtFormatted
        
        
        self.title = article.source.name
        
        if let urlToImage = article.urlToImage,
           let url = URL (string: urlToImage) {
            urlToImageOut.af.setImage(withURL: url)
            
            
            
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
