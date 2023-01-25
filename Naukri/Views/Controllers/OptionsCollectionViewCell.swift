//
//  OptionsCollectionViewCell.swift
//  MyApplies
//
//  Created by Capgemini-DA078 on 15/12/22.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var OptionLabel: UILabel!
    @IBOutlet var cellBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        cellView.layer.cornerRadius = 30.0
//        cellView.layer.borderColor = .init(red: 0.1, green: 0.1, blue: 30, alpha: 1)
//        cellView.layer.borderWidth = 1
    }
    @IBAction func cellBtnAction(_ sender: Any) {
        print("Done")
        OptionLabel.textColor = UIColor.blue
    }
}
