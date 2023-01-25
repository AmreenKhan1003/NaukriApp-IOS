//
//  sideMenuPassData.swift
//  Naukri
//
//  Created by Capgemini on 23/12/22.
//

import Foundation

class SideMenuPass{
    static var ids : Int = 0
    static var whichView: Int = 0
    func addData(passid: Int) {
        SideMenuPass.ids = passid
        //print(SideMenuPass.ids)
    }
    
    func passData() -> Int{
        //print(SideMenuPass.ids)
        return SideMenuPass.ids
    }
    
    func addWhichView(idView: Int){
        SideMenuPass.whichView = idView
    }
    func passViewId() -> Int{
        return SideMenuPass.whichView
    }
}


