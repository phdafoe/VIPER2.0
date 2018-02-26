//
//  ImagenViewCell.swift
//  VIPER2.0
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ImagenViewCell: UICollectionViewCell, ReuseIdentifier {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var myImageFromDataWeb: UIImageView!
    @IBOutlet weak var myPriceFromDataWeb: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
