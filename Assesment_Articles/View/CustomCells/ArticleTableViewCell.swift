//
//  ArticleTableViewCell.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 26/08/2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var sourcelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var bylbl: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
