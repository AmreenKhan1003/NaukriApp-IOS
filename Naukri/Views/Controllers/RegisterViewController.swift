//
//  RegisterScreen.swift
//  NaukriApp
//
//  Created by Capgemini-DA078 on 13/11/22.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var whichOne = 0
// IBOutlets
    //Buttons
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var showButton: UIButton!
    @IBOutlet var updateResumebtn: UIButton!
    //Labels
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameErrorLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailErrorLabel: UILabel!
    @IBOutlet var createPasswordLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var mobileNumLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    @IBOutlet var mobileErrorLabel: UILabel!
    //Text Fields
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var mobileNumTextField: UITextField!
    @IBOutlet var optionalTextField: UITextField!
    @IBOutlet var docTextField: UITextField!
    @IBOutlet var showTextField: UITextField!
    //Views
    @IBOutlet var nameView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var mobileNumView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Removing border on textField
        optionalTextField.borderStyle = .none
    
        //Corner Radius for register button
        applyCornerRadius(radiusValue: 20)
        
        //Mobile Number digits control event
        mobileNumTextField.addTarget(self, action: #selector(textFieldDidChange) , for: UIControl.Event.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    //MARK: storing Register Data
    
    func addData(){
        let name = nameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let mobile = mobileNumTextField.text!
        
        let handler = UserDatahandlers()
        print(handler.saveDetails(name: name, email: email, password: password, mobile: mobile, loggedIn: true, loggedOut: false))
        
    }
    
    
    //Mobile Number digits control function
    @objc func textFieldDidChange(textField: UITextField){
            let text = textField.text
            if (text?.utf16.count)! >= 10{
    print("done")
                textField.isUserInteractionEnabled = false

    }
    }
    // MARK: Corner radius function for buttons
    private func applyCornerRadius(radiusValue: CGFloat) {
        registerButton.layer.cornerRadius = radiusValue
    }
    //Open Gallery Function for update resume button
    func tapGesture() {
            let imagePicker  = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    @IBAction func updateResumeBtnAction(_ sender: Any) {
        tapGesture()
    }
    
    @IBAction func showButtonAction(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.passwordTextField.isSecureTextEntry = false
            showTextField.text = "Hide"
        } else {
            self.passwordTextField.isSecureTextEntry = true
            showTextField.text = "Show"
        }
    }
    
    @IBAction func registerBtnAction(_ sender: Any) {
        // MARK: Checking if details are entered
        if(nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || mobileNumTextField.text == "") {
            
            if(nameTextField.text == ""){
            nameView.backgroundColor = UIColor.red
            nameErrorLabel.text = "Full name is required"
            nameErrorLabel.textColor = UIColor.red
            }
            if(emailTextField.text == "") {
            emailView.backgroundColor = UIColor.red
            emailErrorLabel.text = "Email Address is required"
            emailErrorLabel.textColor = UIColor.red
            }
            if(passwordTextField.text == "") {
            passwordView.backgroundColor = UIColor.red
            passwordLabel.text = "Password is required"
            passwordLabel.textColor = UIColor.red
            }
            if(mobileNumTextField.text == "") {
            mobileNumView.backgroundColor = UIColor.red
            mobileErrorLabel.text = "Please Enter a valid Mobile Number  of 10 digits"
            mobileErrorLabel.textColor = UIColor.red
            }
            }
        else{
            addData()
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
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
//            //self.push(nextViewController, animated:true, completion:nil)
//            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func nameTextFieldActionClicked(_ sender: Any) {
        nameView.backgroundColor = UIColor.blue
        nameLabel.textColor = UIColor.blue
    }

    @IBAction func nameTextFieldAction(_ sender: Any) {
        let text = nameTextField.text
        if(text == "") {
            nameView.backgroundColor = UIColor.red
            nameLabel.textColor = UIColor.gray
            nameErrorLabel.text = "Full name is required"
            nameErrorLabel.textColor = UIColor.red
        }
        else if (!(text?.ValidateName(name: text!))!){
            nameView.backgroundColor = UIColor.red
            nameErrorLabel.text = "Full name is not valid"
            nameErrorLabel.textColor = UIColor.red
            nameLabel.textColor = UIColor.gray
        }
        else if((text != nil) == text?.ValidateName(name: text!)) {
            nameView.backgroundColor = UIColor.gray
            nameLabel.textColor = UIColor.gray
            nameErrorLabel.text = ""
            nameErrorLabel.textColor = UIColor.gray
        }
    }
    
    @IBAction func emailTxtFldActionClicked(_ sender: Any) {
        emailView.backgroundColor = UIColor.blue
        emailLabel.textColor = UIColor.blue
    }
    @IBAction func emailTxtFldAction(_ sender: Any) {
      let text = emailTextField.text
        if(text == "") {
            emailView.backgroundColor = UIColor.red
            emailLabel.textColor = UIColor.gray
            emailErrorLabel.text = "Email Address is required"
            emailErrorLabel.textColor = UIColor.red
        }
        else if (!(text?.ValidateEmailId())!){
            emailView.backgroundColor = UIColor.red
            emailLabel.textColor = UIColor.gray
            emailErrorLabel.text = "Email Address is not valid"
            emailErrorLabel.textColor = UIColor.red
        }
        else if((text != nil) == text?.ValidateEmailId()) {
            emailView.backgroundColor = UIColor.gray
            emailLabel.textColor = UIColor.gray
            emailErrorLabel.text = ""
            emailErrorLabel.textColor = UIColor.gray
        }
    }
    
    @IBAction func passwordTxtFldActionClicked(_ sender: Any) {
        passwordView.backgroundColor = UIColor.blue
        createPasswordLabel.textColor = UIColor.blue
    }
    
    @IBAction func passwordTxtFldAction(_ sender: Any) {
       let text = passwordTextField.text
        if(text == "") {
            passwordView.backgroundColor = UIColor.red
            passwordLabel.text = "Password is required"
            passwordLabel.textColor = UIColor.red
            createPasswordLabel.textColor = UIColor.gray
        }
        else if (!(text?.ValidatePassword())!){
            passwordView.backgroundColor = UIColor.red
            passwordLabel.text = "Password should be minimum 6 characters"
            passwordLabel.textColor = UIColor.red
            createPasswordLabel.textColor = UIColor.gray
        }
        else if((text != nil) == text?.ValidatePassword()) {
            passwordView.backgroundColor = UIColor.gray
            passwordLabel.textColor = UIColor.gray
            passwordLabel.text = ""
            createPasswordLabel.textColor = UIColor.gray
        }
    }
    
    @IBAction func mobileNumTxtFldActionClicked(_ sender: Any) {
        mobileNumView.backgroundColor = UIColor.blue
        mobileNumLabel.textColor = UIColor.blue    }
    
    @IBAction func mobileNumTxtFldAction(_ sender: Any) {
        let text = mobileNumTextField.text
        if(text == "") {
            mobileNumView.backgroundColor = UIColor.red
            mobileErrorLabel.text = "Please Enter a valid Mobile Number  of 10 digits"
            mobileErrorLabel.textColor = UIColor.red
            mobileNumLabel.textColor = UIColor.gray
        }
      else {
            mobileNumView.backgroundColor = UIColor.gray
            mobileLabel.textColor = UIColor.gray
            mobileErrorLabel.text = ""
            mobileNumLabel.textColor = UIColor.gray
        } 
       }

        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.    }*/
}
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        updateResumebtn.self = info[.originalImage] as? UIButton
        dismiss(animated: true, completion: nil)
    }
}
