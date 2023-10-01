//
//  SliderCollectionViewCell.swift
//  KariyerApp
//
//  Created by Turgay KIRKIL on 27.09.2023.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 14

    }


}
