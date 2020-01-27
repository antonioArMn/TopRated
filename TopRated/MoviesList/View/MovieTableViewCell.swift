//
//  MovieTableViewCell.swift
//  TopRated
//
//  Created by José Antonio Arellano Mendoza on 1/27/20.
//  Copyright © 2020 José Antonio Arellano Mendoza. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
  
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var releaseDate: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
