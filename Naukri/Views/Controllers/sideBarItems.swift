//
//  sideBarItems.swift
//  Naukri
//
//  Created by Capgemini on 21/12/22.
//

import UIKit

class sideBarItems: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit(){
        let xibView = Bundle.main.loadNibNamed("sideBarItems", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }

    @IBAction func jobseekersButtonClicked(_ sender: Any) {
        let add = SideMenuPass()
        add.addData(passid: 2)
    }
    @IBAction func settingButtonClicked(_ sender: Any) {
        print("hello")
        
        let add = SideMenuPass()
        add.addData(passid: 1)
    }
}
