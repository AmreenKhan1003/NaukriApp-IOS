//
//  ProfilesViewController.swift
//  Naukri
//
//  Created by Capgemini-DA071 on 12/4/22.
//

import UIKit

class ProfilesViewController: UIViewController {

    var passId = SideMenuPass()
    @IBOutlet weak var sideBarItemsView: sideBarItems!
    @IBOutlet weak var profileSideView: ProfileSideBarView!
    @IBOutlet weak var sideBarView: UIView!
    
    //   @IBOutlet weak var barView: ProfileBarView!
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var profileBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var performanceBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var profile: UIButton!
    
    @IBOutlet weak var performance: UIButton!
    
    
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideBarView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        profileView.backgroundColor = UIColor.white
        sideBarView.isHidden = true
        let logtype = UserOnCoreData()
        if logtype.checkLogType() == true{
            profileView.isHidden = false
        }
        else{
            profileView.isHidden = true
        }
    }
    
    override func viewWillLayoutSubviews() {
        
        let viewid = passId.passData()
        SideMenuPass.whichView = 4
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

    @IBAction func profileBtn(_ sender: Any) {
        
        profileLabel.text = "Create your Profile"
        detailLabel.text = "Make your profile stand out as recruiter will be able to see you"
        profileBottomConstraint.constant = 3
        performanceBottomConstraint.constant = 0
        profile.configuration?.baseForegroundColor = UIColor.black
        performance.configuration?.baseForegroundColor = UIColor.gray
        
    }
    
    
    @IBAction func performanceBtn(_ sender: Any) {
        
        profileLabel.text = "Demand For Your Profile"
        detailLabel.text = "See which recruiters are showing intrest in your profile"
        profileBottomConstraint.constant = 0
        performanceBottomConstraint.constant = 3
        profile.configuration?.baseForegroundColor = UIColor.gray
        performance.configuration?.baseForegroundColor = UIColor.black
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        //performSegue(withIdentifier: "LoginVCPro", sender: self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.whichOne = 4
        //self.push(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
   
    
    @IBAction func registerBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        nextViewController.whichOne = 4
        //self.push(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
        //performSegue(withIdentifier: "RegisterVCPro", sender: self)
    }
   

    @IBAction func sideBarButtonClicked(_ sender: Any) {
        if sideBarView.isHidden == true{
            sideBarView.isHidden = false
            //profileView.backgroundColor = UIColor.gray
            //sideBarView.backgroundColor = UIColor.white
            
        }
        else{
            sideBarView.isHidden = true
            //profileView.backgroundColor = UIColor.white
        }
    }
}
