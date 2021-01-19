//
//  TeamCell.swift
//  NBAWidgetKit
//
//  Created by Nicholas Wang on 2021-01-17.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
