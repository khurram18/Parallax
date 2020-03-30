//
//  TableViewCell.swift
//  Parallex
//
//  Created by Khurram on 30/03/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var featureImageView: UIImageView!
  @IBOutlet weak var contributerNameLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
}

}
