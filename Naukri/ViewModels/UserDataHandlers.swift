

import Foundation

class UserDatahandlers: NSObject{
    
    private let userActivity = UserOnCoreData()
    
    func saveDetails(name: String, email: String, password: String, mobile: String, loggedIn: Bool, loggedOut: Bool) -> Bool{
        //let
        return userActivity.StoreOnCoreData(names: name, emails: email, passwords: password, mobiles: mobile,loggedIn: loggedIn, loggedOut: loggedOut)
    }
    
    func existingUserEmail(email: String) ->Bool{
        
        return userActivity.FetchEmailFromCoreData(email: email )
    }
    
    func existingUserPassword(email: String, password: String) -> Bool{
        return userActivity.FetchPasswordFromCoreData(email: email, password: password)
    }
    
    func loggedIn() -> Bool{
        return userActivity.checkUserLoggedIn()
    }
    
}
