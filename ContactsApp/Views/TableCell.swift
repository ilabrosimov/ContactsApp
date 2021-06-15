//
//  TableCell.swift
//  ContactsApp
//
//  Created by ilabrosimov on 14.06.2021.
//

import UIKit
class TableCell: UITableViewCell {
    static let identifier = "TableCell"
    
    //MARK: - Views and Subviews
     private let label :UILabel = {
        let label = UILabel()
        label.contentMode = .scaleToFill
        label.font = .systemFont(ofSize: 18)
        label.text = "Text"
        
        return label
     }()
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    //MARK: - Public set Methods
    func configureImage(image: UIImage?)  {
        self.image.image = image
    }
    func cofigureLabel(text : String)  {
        self.label.text = text
        
    }
    //MARK: - Life cycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(image)
        contentView.addSubview(label)
        selectionStyle = .none
    }
    //MARK: - Layout methods
    override func layoutSubviews() {
        super.layoutSubviews()
        image.sizeToFit()
        let width = contentView.frame.width
        let height = contentView.frame.height
        image.frame = CGRect(x: 10, y: height / 4, width: width / 10, height: height / 2)
        label.frame = CGRect(x: image.frame.width + 10 , y: 0, width: width - width / 10 , height: height)
    }
    //MARK: - Error methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
