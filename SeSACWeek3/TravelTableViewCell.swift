//
//  TravelTableViewCell.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/14/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    @IBOutlet var travelLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        travelLabel.backgroundColor = .yellow
        travelLabel.text = "테스트"
        travelLabel.font = .boldSystemFont(ofSize: 17)
        
        
    }

    
    
}
