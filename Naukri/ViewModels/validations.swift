//
//  validations.swift
//  Naukri
//
//  Created by Capgemini-DA073 on 11/23/22.
//

import Foundation

class Validations{
    
    func emailValidation(email: String) -> Bool{
        //var result = false
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        //return false
    }
    
    func passwordValidation(passwords: String) -> Bool{
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return password.evaluate(with: passwords)
    }
}

