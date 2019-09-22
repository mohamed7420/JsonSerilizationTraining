//
//  ViewController.swift
//  JsonSerilizationTraining
//
//  Created by Mohamed on 9/22/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    let url = "https://jsonplaceholder.typicode.com/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            
            if let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String:Any]]
            {
                
                
                for i in dictionary{
                    
                    guard let post = Posts(dictionary: i) else {return}
                    
                    print(post.title)
                    print(post.body)
                    print(post.id)
                }
                
                
                
            }
            
        }.resume()
        
        
       

}


struct Posts {
    
    var userId:Int
    var id:Int
    var title:String
    var body:String
    
    
    init?(dictionary:[String:Any]) {
        
        guard let userId = dictionary["userId"] ,
            let id     = dictionary["id"],
            let title  = dictionary["title"] ,
            let body   = dictionary["body"] else {return nil}
        
        self.userId = userId as! Int
        self.id     = id as! Int
        self.title  = title as! String
        self.body   = body as! String
        
    }
    
    
}
}

