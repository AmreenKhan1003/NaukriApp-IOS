//
//  ProfileSideBarView.swift
//  Naukri
//
//  Created by Capgemini on 21/12/22.
//

import UIKit

class ProfileSideBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit(){
        let xibView = Bundle.main.loadNibNamed("sideBarProfile", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
}
