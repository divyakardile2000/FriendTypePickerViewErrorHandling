//
//  CustomTableViewCell.swift
//  FriendTypePickerView
//
//  Created by Mac on 08/10/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabelC: UILabel!
    @IBOutlet weak var nameLabelC: UILabel!
    @IBOutlet weak var addressLabelC: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
