//
//  JsonParser.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 26/08/2021.
//

import Foundation
class JsonParser {
    static  func parseArticles(data : Data) -> Array<Article> {
        var articles = Array<Article>()
        
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        if let dictionary = json as? [String: Any] {
            if let results = dictionary["results"] as? [[String:Any]] {
                for  article in results {
                    let ar = Article(published_date: article["published_date"] as? String, title: article["title"] as? String, abstract: article["abstract"] as? String,byLine: article["byline"] as? String,url: article["url"] as? String, section: article["section"] as? String)
                    
                    articles.append(ar)
                    
                }
            }
        }
        
                   return articles
    
}
}
