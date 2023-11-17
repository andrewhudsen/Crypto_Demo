//
//  TableViewCell.swift
//  Crypto
//
//  Created by Andrew on 17/11/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var logoImgVw: UIImageView!
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var graphImgVw: UIImageView!
    @IBOutlet weak var usdLbl: UILabel!
    @IBOutlet weak var percentLbl: UILabel!
    @IBOutlet weak var noResultLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
