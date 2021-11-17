//
//  ListNewsCell.swift
//  News-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit
import SDWebImage

class ListNewsCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setView(data: News) {
        self.newsImage.sd_setImage(with: URL(string: data.image), placeholderImage: UIImage(named: "AppIcon"))
        self.titleLabel.text = data.title
        self.authorLabel.text = data.author
        self.descriptionLabel.text = data.description
    }
}
