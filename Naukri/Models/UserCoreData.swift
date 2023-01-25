//
//  UserCoreData.swift
//  NaukriApp
//
//  Created by Capgemini-DA073 on 11/15/22.
//

import Foundation
import CoreData
import UIKit

class UserOnCoreData: UIViewController{
    
    
    
    //func to register data on coreData
    func StoreOnCoreData(names: String, emails: String, passwords: String, mobiles: String, loggedIn: Bool, loggedOut: Bool) -> Bool{
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let userData = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context) as! UserData
        
        userData.email = emails
        userData.password = passwords
        userData.name = names
        userData.mobile = mobiles
        userData.loggedIn = loggedIn
        userData.loggedOut = loggedOut
        do{
            try context.save()
            print("Data has been stored")
            return true
        }catch {
            print("Cant load")
            return false
        }
        
    }//end of function
    
    func FetchEmailFromCoreData(email: String) -> Bool{
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var flag = 0
        do{
            let edata = try context.fetch(UserData.fetchRequest())
                    for data in edata{
                        let tomatchemail = data.email
                        if(tomatchemail == email ){
                            flag = 1
                            print(tomatchemail as Any)
                            break
                        }
                    }
        }catch{
            print("cant load")
            return false
        }
        if flag == 1{
            return true
        }
        else{
            return false
        }
    }//end of fucntion
    
    func FetchPasswordFromCoreData(email: String, password: String) -> Bool{
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var flag = 0
        do{
            let edata = try context.fetch(UserData.fetchRequest())
                    for data in edata{
                        let tomatchemail = data.email
                        let tomatchpassword = data.password
                        if(tomatchemail == email && tomatchpassword == password){
                            //email exist
                            flag = 1
                            print(tomatchpassword as Any)
                            break
                        }
                    }
        }catch{
            print("cant load")
            return false
        }
        if flag == 1{
            return true
        }
        else{
            return false
        }
    }//end of fucntion
    
    func checkUserLoggedIn() -> Bool{
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //var flag = 0
        var count = 0
        do{
            let edata = try context.fetch(UserData.fetchRequest())
            for _ in edata{
                        count += 1
                    }
        }catch{
            print("cant load")
            return false
        }
        if count == 1{
            return true
        }
        else{
            print(count)
            return false
        }
    }
    
    static var sessions: Bool = false
    static var logoutYet: Bool = false
    
    func userLogedIn(){
        UserOnCoreData.sessions = true
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let userData = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context) as! UserData
        
        userData.loggedIn = true
        userData.loggedOut = false
        do{
            try context.save()
            
            
        }catch{
            print("Cant load")
            
        }
    }
    
    func userLogedOut(){
        UserOnCoreData.sessions = false
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let userData = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context) as! UserData
        
        userData.loggedIn = false
        userData.loggedOut = true
        do{
            try context.save()
           
            
        }catch{
            print("Cant load")
            
        }
    }
    
    func removeUser(){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
        //var logtype: Bool = false
        if let result = try? context.fetch(UserData.fetchRequest()) {
            for object in result {
                context.delete(object)
            }
        }

        do {
            try context.save()
        } catch {
            //Handle error
        }
    }
    
    func checkLogType() -> Bool{
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var logtype: Bool = false
        do{
            let edata = try context.fetch(UserData.fetchRequest())
                    for data in edata{
                        
                        logtype = data.loggedIn
                        
                    }
        }catch{
            print("cant load")
            return false
        }
        return logtype
    }
    
    
}//end of class
