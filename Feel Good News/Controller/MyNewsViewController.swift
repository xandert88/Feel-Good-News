//
//  MyNewsViewController.swift
//  Feel Good News
//
//  Created by Alexander Thompson on 12/2/21.
//

import UIKit

class MyNewsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var newsManager = NewsManager()
    var articles: [Article]?
    var number: Int?
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsManager.delegate = self
        newsManager.parseData()
       
    }
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print(articles?.count)
        label.text = articles?[0].image
        //imageView.image = newsManager.getImage(from: (articles?[1].image)!)
      
        
    }
}

//MARK: - News Manager Delegate

extension MyNewsViewController: NewsManagerDelegate {
    func updateNews(_ newsManager: NewsManager, news: Articles) {
        DispatchQueue.main.async {
            //self.label.text = String(news.articles.count)
            self.articles = news.data
            self.number = news.data.count
            
            
           
        }
        
    }
    
    
    
}

 
