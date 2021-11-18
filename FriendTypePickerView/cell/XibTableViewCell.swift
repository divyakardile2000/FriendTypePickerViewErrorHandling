//
//  XibTableViewCell.swift
//  FriendTypePickerView
//
//  Created by Mac on 08/10/21.
//

import UIKit

class XibTableViewCell: UITableViewCell {
    @IBOutlet weak var typelabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
