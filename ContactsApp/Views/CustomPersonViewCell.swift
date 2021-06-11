//
//  TableViewCell.swift
//  ContactsApp
//
//  Created by ilabrosimov on 11.06.2021.
//

import UIKit

class CustomPersonViewCell: UITableViewCell {
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
