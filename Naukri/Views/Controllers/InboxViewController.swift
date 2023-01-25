//
//  InboxViewController.swift
//  Naukri
//
//  Created by Capgemini-DA073 on 12/8/22.
//

import UIKit

class InboxViewController: UIViewController {
    
    var passId = SideMenuPass()
    //sidebar
    @IBOutlet weak var sideBarView: UIView!
    
    @IBOutlet weak var profileSideView: ProfileSideBarView!
    
    @IBOutlet weak var sideBarItemsView: sideBarItems!
    
    @IBOutlet weak var InboxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButtonClicked(_ sender: Any) {
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterScreen") as! RegisterScreen
//        //self.push(nextViewController, animated:true, completion:nil)
//        self.navigationController?.pushViewController(nextViewController, animated: true)
        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        nextViewController.whichOne = 3
        //self.push(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        sideBarView.isHidden = true
        InboxView.backgroundColor = UIColor.white
        let logtype = UserOnCoreData()
        if logtype.checkLogType() == true{
            InboxView.isHidden = false
        }
        else{
            InboxView.isHidden = true
        }
    }
    
    override func viewWillLayoutSubviews() {
        
        let viewid = passId.passData()
        SideMenuPass.whichView = 3
        print(viewid)
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

    @IBAction func loginButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.whichOne = 3
        //self.push(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func sideBarButtonClicked(_ sender: Any) {
        
        if sideBarView.isHidden == true{
            sideBarView.isHidden = false
            //InboxView.backgroundColor = UIColor.gray
            //sideBarView.backgroundColor = UIColor.white
        }
        else{
            sideBarView.isHidden = true
            //InboxView.backgroundColor = UIColor.white
        }
    }
}
