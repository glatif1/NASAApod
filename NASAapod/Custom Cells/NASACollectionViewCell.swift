//
//  NASACollectionViewCell.swift
//  NASAapod
//
//  Created by Ghufran Latif  on 3/3/21.
//

import UIKit
import SDWebImage

class NASACollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var label1: UILabel!
    
    func setUp(apodVM: ApodViewModel){
        imgView?.sd_setImage(with: apodVM.getImageUrl(), placeholderImage: UIImage(named: "loading"))
        label1.text = apodVM.getTitle()
    }
    
}
    
