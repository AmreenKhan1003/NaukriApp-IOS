//
//  LoginViewController.swift
//  NaukriApp
//
//  Created by Capgemini-DA073 on 11/13/22.
//

import UIKit
import TinyConstraints
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var flag = 1
    var whichOne = 0
    @IBOutlet weak var eyeIcon: UIButton!
    @IBOutlet weak var passmsgLabel: UILabel!
    @IBOutlet weak var emailmsgLabel: UILabel!
    @IBOutlet weak var emailLineView: UIView!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var loginOTPButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passLineView: UIView!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func emailButtonClicked(_ sender: Any) {
        if ((sender as AnyObject).tag == 1){
            usernameButton.isSelected = false
            emailButton.isSelected = true
            flag = 1
        }
        
        if emailButton.isSelected == true{
            emailButton.setBackgroundImage(UIImage(named: "check"), for: .selected)
            emailLabel.placeholder = "Enter your email address"
        }
    } //end of emailButtonClicked
    
    @IBAction func usernameButtonClicked(_ sender: Any) {
        if ((sender as AnyObject).tag == 2){
            usernameButton.isSelected = true
            emailButton.isSelected = false
            flag = 0
        }
        
        if usernameButton.isSelected == true{
            usernameButton.setBackgroundImage(UIImage(named: "check"), for: .selected)
            emailButton.setBackgroundImage(UIImage(named: "uncheck"), for: .normal)
            emailLabel.placeholder = "Enter your username"
        }
        
       
    }//end of usernameButton
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
        
        if (emailLabel.text != "" && passwordLabel.text != ""){
        //for email
            if flag == 1{
                let validate = Validations()
                let email = emailLabel.text
                let password = passwordLabel.text
            
                if validate.emailValidation(email: email!) == true{
                    
//                    let user = UserOnCoreData()
//                    print(user.StoreOnCoreData(names: "Amreen", emails: "amreen@gmail.com", passwords: "Amreen786", mobiles: "9967534918"))
                    
                    
                        let user = UserOnCoreData()
                    print(user.StoreOnCoreData(names: "Amreen", emails: "amreen@gmail.com", passwords: "Amreen786", mobiles: "9967534918", loggedIn: true, loggedOut: false))
                    
                    
                //search in core data
                    let datahandlers = UserDatahandlers()
                    let emailPresent = datahandlers.existingUserEmail(email: email!)
                    let passMatch = datahandlers.existingUserPassword(email: email!, password: password!)
                
                    if (emailPresent == true && passMatch == true){
                        
                        //start session
                        let startSession = UserOnCoreData()
                        startSession.userLogedIn()
                        
                        
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
                        let test = UserOnCoreData()
                        print("On loggedIn \(test.checkUserLoggedIn())")
                    }
                
                    else if (emailPresent == false){
                        emailLineView.backgroundColor = UIColor.red
                        emailmsgLabel.text = "No account found, Please register"
                    }
                
                    else if(passMatch == false){
                        passLineView.backgroundColor = UIColor.red
                        passmsgLabel.text = "Invalid password, check your password."
                    }
                
                }
                else{
                //Invalid email format
                emailLineView.backgroundColor = UIColor.red
                emailmsgLabel.text = "Please enter valid email id/username"
                }
            }//end of if flag
        
        //if flag 0 username
            if flag == 0{
                print("user logged in by username.")
            }
        }// end of if for checking email and password is not empty
        else{
            emailLineView.backgroundColor = UIColor.red
            emailmsgLabel.text = "Please enter your email address."
            passLineView.backgroundColor = UIColor.red
            passmsgLabel.text = "Please enter your password."
        }
        
    }
    
    @IBAction func eyeClick(_ sender: Any) {
        if passwordLabel.isSecureTextEntry == true{
            passwordLabel.isSecureTextEntry = false
        }
        else{
            passwordLabel.isSecureTextEntry = true
        }
    }
    
    
    @IBAction func emailTextFieldClicked(_ sender: Any) {
        emailLineView.backgroundColor = UIColor.blue
        emailmsgLabel.text = ""
        passLineView.backgroundColor = UIColor.gray
    }
    
    @IBAction func passwordTextFieldClicked(_ sender: Any) {
        passLineView.backgroundColor = UIColor.blue
        passmsgLabel.text = ""
        emailLineView.backgroundColor = UIColor.systemGray3
        emailmsgLabel.text = ""
        
        if emailLabel.text == ""{
            emailLineView.backgroundColor = UIColor.red
            emailmsgLabel.text = "Please enter email address."
        }
    }
    
    //anonymous signin
    @IBAction func loginWithOTPClicked(_ sender: Any) {
        let auth = Auth.auth()
        auth.signInAnonymously { result, err in
            if (err != nil){
                print(err?.localizedDescription as Any)
                return
            }
            print("Successfully signed in Anonymously")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
            //self.push(nextViewController, animated:true, completion:nil)
            nextViewController.whichOne = self.whichOne
            self.navigationController?.pushViewController(nextViewController, animated: true)
            
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SignUp", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        //self.push(nextViewController, animated:true, completion:nil)
        nextViewController.whichOne = self.whichOne
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
}
