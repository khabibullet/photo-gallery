//
//  MyCollectionViewCell.swift
//  collection
//
//  Created by Alebelly Nemesis on 8/14/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

	var id = "MyCollectionViewCell"
	
	@IBOutlet weak var myImage: UIImageView!
	@IBOutlet weak var imageLoadIndicator: UIActivityIndicatorView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		imageLoadIndicator.hidesWhenStopped =  true
		imageLoadIndicator.startAnimating()
    }
}
