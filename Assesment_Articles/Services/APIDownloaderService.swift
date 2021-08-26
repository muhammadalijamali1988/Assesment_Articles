//
//  APIDownloaderService.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 25/08/2021.
//

import Foundation
typealias ArticleAPISuccessClosure = (Array<Article>) -> Void
typealias DefaultAPIFailureClosure = (NSError) -> Void
typealias EmptyClosure = () -> ()
class APIDownloaderService {
     private var dataTask: URLSessionDataTask?
     private let defaultSession = URLSession(configuration: .default)
    
    func downloadArticles(success : @escaping(ArticleAPISuccessClosure), failure : @escaping(DefaultAPIFailureClosure)) {
        dataTask?.cancel()
        print("Download Articles \(Constants.baseURL)")
        if let urlComp = URLComponents(string: "\(Constants.baseURL)\(Route.Articles.rawValue)\(ArticlesPeroid.SevenDays.rawValue)\(Constants.contentExtension)?api-key=\(Constants.api_key)" ) {
            guard let url = urlComp.url else {
                return
            }
        dataTask =
               defaultSession.dataTask(with: url) { [weak self] data, response, error in
               defer { self?.dataTask = nil}
                if let error = error {
                    print(error)
                   }
                else if
                      let data = data,
                      let response = response as? HTTPURLResponse,
                    response.statusCode == HTTPResponseCodes.OK.rawValue {
                     
                     let articles = JsonParser.parseArticles(data:data)
                     success(articles)
                    
                } // end of the error code
                else {
                   
                }
                
             
        }
            dataTask?.resume()
    }
    }
    
    
   
    
    
    
}
