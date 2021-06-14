//
//  TableHeader.swift
//  ContactsApp
//
//  Created by ilabrosimov on 14.06.2021.
//

import UIKit

class TableHeader : UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
     private let label :UILabel = {
        let label = UILabel()
        label.contentMode = .scaleToFill
        label.font = UIFont(name: "Lobster-Regular", size: 20)
         
        
        return label
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        backgroundColor = .red
        
        
    }
     func configureLabel (text : String) {
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 20, y: 0, width: contentView.frame.width, height: contentView.frame.height)
    }
}
