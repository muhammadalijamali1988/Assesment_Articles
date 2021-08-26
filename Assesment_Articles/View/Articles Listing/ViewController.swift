//
//  ViewController.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 25/08/2021.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var articleTable: UITableView!
    var viewModel = ArtcileViewModel()
    let ROWHEIGHT : CGFloat = 117
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addSideMenuBarButtonItem()
        addMoreBarButtonItem(named: "magnifyingglass")
      //  self.navigationItem.title = "NY Times Most Popular"
        if networkStatus == .online {
        viewModel.downloadArticles {
            DispatchQueue.main.async {
            self.articleTable.reloadData()
            }
        } error: { error in
            print(error)
        }
        }
        else {
            print("No Interview Avaiable")
        }


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = listScreenTitle
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        self.title = ""
    }


}


extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.allArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_article") as! ArticleTableViewCell
        viewModel.configureArticleCell(cell: cell, row: indexPath.row)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ROWHEIGHT
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedArtices = self.viewModel.allArticles[indexPath.row]
        
        self.performSegue(withIdentifier: "sw_showDetail", sender: self)
    }
    
    
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sw_showDetail" && self.viewModel.selectedArtices != nil{
            let destinationVC = segue.destination as! ArticleDetailViewController
            destinationVC.urlToLoad = self.viewModel.selectedArtices?.url
            
                
        }
    }
    
}



