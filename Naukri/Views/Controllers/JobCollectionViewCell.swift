//
//  JobCollectionViewCell.swift
//  Scroll View
//
//  Created by Capgemini-DA071 on 12/15/22.
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var review: UILabel!
    
    
    @IBOutlet weak var about: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
