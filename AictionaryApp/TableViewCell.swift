//
//  TableViewCell.swift
//  AictionaryApp
//
//  Created by Selim on 29.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var turkceLabel: UILabel!
    @IBOutlet weak var ingilizceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
