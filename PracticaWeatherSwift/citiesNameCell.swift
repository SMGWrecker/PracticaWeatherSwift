//
//  citiesNameCell.swift
//  PracticaWeatherSwift
//
//  Created by user on 04/12/2020.
//

import UIKit

class citiesNameCell: UITableViewCell {

    @IBOutlet weak var cityTemp: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
