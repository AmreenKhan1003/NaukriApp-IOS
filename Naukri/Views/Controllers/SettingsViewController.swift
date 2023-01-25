//
//  SettingsViewController.swift
//  Naukri
//
//  Created by Capgemini on 25/12/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    var viewIds = SideMenuPass()
    @IBAction func logOutButtonClicked(_ sender: Any) {
        let endSession = UserOnCoreData()
        UserOnCoreData.logoutYet = true
        endSession.removeUser()
        let test = UserOnCoreData()
        print("On loggedIn \(test.checkUserLoggedIn())")
        
        if (viewIds.passViewId() == 0){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
            //self.push(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        
        if (viewIds.passViewId() == 2){
            let storyBoard : UIStoryboard = UIStoryboard(name: "MyApplies", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MyAppliesViewController") as! MyAppliesViewController
            //self.push(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        if(viewIds.passViewId() == 3){
            let storyBoard : UIStoryboard = UIStoryboard(name: "Inboxess", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
            //self.push(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        if(viewIds.passViewId() == 4){
            let storyBoard : UIStoryboard = UIStoryboard(name: "profile", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProfilesViewController") as! ProfilesViewController
            //self.push(nextViewController, animated:true, completion:nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }

        endSession.userLogedOut()
    }
}
