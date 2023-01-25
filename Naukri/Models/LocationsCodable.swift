//
//  LocationsCodable.swift
//  Naukri
//
//  Created by Capgemini on 21/12/22.
//

import Foundation

class LocationClass: Codable{
    
    var Maharashtra = [CitiesClass]()
    var Delhi = [CitiesClass]()
    var Karnataka = [CitiesClass]()
    var Gujarat = [CitiesClass]()
    var Telangana = [CitiesClass]()
    var TamilNadu = [CitiesClass]()
    var WestBengal = [CitiesClass]()
    var Rajasthan = [CitiesClass]()
    var UttarPradesh = [CitiesClass]()
    var Bihar = [CitiesClass]()
    var MadhyaPradesh = [CitiesClass]()
    var AndhraPradesh = [CitiesClass]()
    var Punjab = [CitiesClass]()
    var Haryana = [CitiesClass]()
    var Jharkhand = [CitiesClass]()
    var Chhattisgarh = [CitiesClass]()
    var Assam = [CitiesClass]()
    var Chandigarh = [CitiesClass]()
    var Odisha = [CitiesClass]()
    var Kerala = [CitiesClass]()
    var Puducherry = [CitiesClass]()
    var Tripura = [CitiesClass]()
    var Karnatka = [CitiesClass]()
    
}

class CitiesClass: Codable{
    var city: String
}
