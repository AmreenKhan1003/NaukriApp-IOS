//
//  UserData+CoreDataProperties.swift
//  
//
//  Created by Capgemini on 09/01/23.
//
//

import Foundation
import CoreData


extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var email: String?
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var loggedIn: Bool
    @NSManaged public var loggedOut: Bool

}
