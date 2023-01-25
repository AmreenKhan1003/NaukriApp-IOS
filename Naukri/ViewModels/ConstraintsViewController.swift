//
//  ConstraintsViewController.swift
//  NaukriApp
//
//  Created by Capgemini-DA078 on 15/11/22.
//

import UIKit

class ConstraintsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
    // MARK: Extension for Validating constraints
    extension String {

    // MARK: function for email validation
    func ValidateEmailId() ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z0-9a-z]{2,3}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    // MARK: Function for password validation
    func ValidatePassword(min: Int = 6, max: Int = 20) -> Bool {
        var passRegEx = ""
            if min >= max {
            passRegEx = "^(?=.*[A-Za-z0-9])[A-Za-z0-9]{\(min),}$" }
            else {
              passRegEx = "^(?=.*[A-Za-z0-9])[A-Za-z0-9]{\(min),\(max)}$"
                }
            return applyPredicateOnRegex(regexStr: passRegEx)
    }
    // MARK: Function for name validation
        func ValidateName(name: String) -> Bool {
            if name.count >= 3{
                return true
            }
            return false
    }
        
    
        
    // MARK: Regex Function
    func applyPredicateOnRegex(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}

    


