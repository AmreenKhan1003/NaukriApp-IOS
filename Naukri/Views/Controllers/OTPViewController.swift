//
//  OTPViewController.swift
//  Naukri
//
//  Created by Capgemini-DA073 on 11/24/22.
//

import UIKit

class OTPViewController: UIViewController,  UITextFieldDelegate {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number4: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var number2: UITextField!
    
    var whichOne = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number1.addTarget(self, action: #selector(textFieldDidChange) , for: UIControl.Event.editingChanged)
        number2.addTarget(self, action: #selector(textFieldDidChange) , for: UIControl.Event.editingChanged)
        number3.addTarget(self, action: #selector(textFieldDidChange) , for: UIControl.Event.editingChanged)
        number4.addTarget(self, action: #selector(textFieldDidChange) , for: UIControl.Event.editingChanged)
        print(whichOne)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if (text?.utf16.count)! >= 1{
            switch textField{
            case number1:
                number2.becomeFirstResponder()
            case number2:
                number3.becomeFirstResponder()
            case number3:
                number4.becomeFirstResponder()
            case number4:
                number4.resignFirstResponder()
            default:
                break
            }
        }
    }

    @IBAction func verifyClicked(_ sender: Any) {
        if (number1.text == "1" && number2.text == "2" && number3.text == "3" && number4.text == "4"){
            //store userid and password
            let user = UserOnCoreData()
            print(user.StoreOnCoreData(names: "Amreen", emails: "amreen@gmail.com", passwords: "Amreen786", mobiles: "9967534918", loggedIn: true, loggedOut: false))
            //check data
            let datahandlers = UserDatahandlers()
            let emailPresent = datahandlers.existingUserEmail(email: "amreen@gmail.com")
            let passMatch = datahandlers.existingUserPassword(email: "amreen@gmail.com", password: "Amreen786")
        
            if (emailPresent == true && passMatch == true){
                
                
                //performSegue(withIdentifier: "HomeVC", sender: self)
                if(whichOne == 0){
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
                                            //self.push(nextViewController, animated:true, completion:nil)
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
                
                if (whichOne == 2){
                    let storyBoard : UIStoryboard = UIStoryboard(name: "MyApplies", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MyAppliesViewController") as! MyAppliesViewController
                    //self.push(nextViewController, animated:true, completion:nil)
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
                
                if (whichOne == 3){
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Inboxess", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
                    //self.push(nextViewController, animated:true, completion:nil)
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
                
                if (whichOne == 4){
                    let storyBoard : UIStoryboard = UIStoryboard(name: "profile", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProfilesViewController") as! ProfilesViewController
                    //self.push(nextViewController, animated:true, completion:nil)
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
                print("Login successfully")
            }
            print("Verified Successfully")
            //performSegue(withIdentifier: "HomeVCOTP", sender: self)
           
        }
    }
    
}


