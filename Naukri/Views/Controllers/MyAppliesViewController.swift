//
//  MyAppliesViewController.swift
//  Naukri
//
//  Created by Capgemini-DA073 on 12/8/22.
//

import UIKit

class MyAppliesViewController: UIViewController {
    
    var passId = SideMenuPass()
    
    @IBOutlet weak var sideBarItemsView: sideBarItems!
    @IBOutlet weak var ProfileSideView: ProfileSideBarView!
    
    
    @IBOutlet weak var sideBarView: UIView!
    @IBOutlet weak var MyAppliesView: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
        
    }
   
    
    override func viewWillLayoutSubviews() {
        print("will layout subview")
        
        let viewid = passId.passData()
        SideMenuPass.whichView = 2
        //print(viewid)
        //open storyboard
        if (viewid == 1){
            passId.addData(passid: 0)
            let storyBoard: UIStoryboard = UIStoryboard(name: "sideMenus", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as! SettingsViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        if (viewid == 2){
            passId.addData(passid: 0)
            let storyBoard: UIStoryboard = UIStoryboard(name: "sideMenus", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "jobseekers") as! JobSeekersViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        
        sideBarView.isHidden = true
        MyAppliesView.backgroundColor = UIColor.white
        
        let logtype = UserOnCoreData()
        if logtype.checkLogType() == true{
            MyAppliesView.isHidden = false
        }
        else{
            MyAppliesView.isHidden = true
        }
        
    }
    
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        //self.push(nextViewController, animated:true, completion:nil)
        nextViewController.whichOne = 2
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func sideBarButtonClicked(_ sender: Any) {
        if sideBarView.isHidden == true{
            sideBarView.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                    //self.sideBarView.frame.origin.x -= 100
                    self.sideBarView.frame.size.width += 200
                })
            //blur view
            //MyAppliesView.backgroundColor = UIColor.gray
            //sideBarView.backgroundColor = UIColor.white
            //self.tabBarController?.tabBar.isHidden = true
        }
        else{
            sideBarView.isHidden = true
            //MyAppliesView.backgroundColor = UIColor.white
            //self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        nextViewController.whichOne = 2
        //self.push(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
}
