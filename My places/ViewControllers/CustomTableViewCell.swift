//
//  CustomTableViewCell.swift
//  My places
//
//  Created by Марк Михайлов on 22.11.2022.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {

 
    @IBOutlet weak var imageOfPlace: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.updateOnTouch = false
        }
    }
    
    
}
