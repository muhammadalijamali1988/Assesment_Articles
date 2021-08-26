//
//  ArticleViewModel.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 26/08/2021.
//

import Foundation
class ArtcileViewModel{
    
    
    var allArticles = Array<Article>()
    var selectedArtices : Article?
    
    func configureArticleCell(cell : ArticleTableViewCell, row : Int) {
        let article = self.allArticles[row]
        cell.articleTitle.text = article.title
        cell.bylbl.text = article.byLine
        cell.datelbl.text = article.published_date
        cell.sourcelbl.text = article.section
        
        
    }
    func downloadArticles(success : @escaping(EmptyClosure), error : @escaping( DefaultAPIFailureClosure)){
        APIDownloaderService().downloadArticles { results in
            self.allArticles = results
            success()
            
            
        } failure: { error in
            
        }
    }
    
}
