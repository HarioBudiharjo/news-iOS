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
        self.newsImage.sd_setImage(with: URL(string: data.image), placeholderImage: UIImage(named: "def"))
        newsImage.layer.borderWidth = 1
        newsImage.layer.masksToBounds = false
        newsImage.layer.borderColor = UIColor.black.cgColor
        newsImage.layer.cornerRadius = newsImage.frame.height/2/2
        
        newsImage.dropShadow(color: UIColor.black, offSet: CGSize(width: 10, height: 10))
        
        self.titleLabel.text = data.title
        self.authorLabel.text = data.author
        self.descriptionLabel.text = data.description
    }
}

extension UIImageView {
func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
