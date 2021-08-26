//
//  ArticleDetailViewController.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 26/08/2021.
//

import UIKit
import WebKit

class ArticleDetailViewController: BaseViewController,WKNavigationDelegate {
    var urlToLoad : String?
    
    
    @IBOutlet weak var webkitView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webkitView.navigationDelegate = self
        if urlToLoad != nil {
            webkitView.load(URLRequest(url: URL(string: urlToLoad!)!))
            webkitView.allowsBackForwardNavigationGestures = true
        }
        // Do any additional setup after loading the view.
    }
    

    
}
