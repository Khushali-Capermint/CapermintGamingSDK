//
//  GamingCollectionViewCell.swift
//  CapermintGamingSDK
//
//  Created by Khushali Nimje on 17/12/20.
//  Copyright © 2020 Khushali Nimje. All rights reserved.
//

import UIKit

class GamingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.imgView.layer.cornerRadius = 10.0
        self.imgView.clipsToBounds = true
    }

}
