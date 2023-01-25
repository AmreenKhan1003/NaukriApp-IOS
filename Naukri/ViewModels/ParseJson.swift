//
//  ParseJson.swift
//  Naukri
//
//  Created by Capgemini on 21/12/22.
//

import Foundation

class ParseJSON{
    
    func fetchSkills() -> Array<String>{
        let emp = [String]()
        let path = Bundle.main.path(forResource: "Skills", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let skills = try JSONDecoder().decode(SkillsClass.self, from: data)
            //print(skills.skills)
            return skills.skills
        }
        catch{
            print(error.localizedDescription)
        }
        return emp
    }
    
    func fetchLocations() -> Array<String>{
        var locationArray = [String]()
        let path = Bundle.main.path(forResource: "Locations", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let location = try JSONDecoder().decode(LocationClass.self, from: data)
            //print(skills.skills)
            for i in location.Maharashtra{
                locationArray.append(i.city)
            }
            for i in location.Delhi{
                locationArray.append(i.city)
            }
            for i in location.AndhraPradesh{
                locationArray.append(i.city)
            }
            for i in location.Bihar{
                locationArray.append(i.city)
            }
            for i in location.Chandigarh{
                locationArray.append(i.city)
            }
            for i in location.Assam{
                locationArray.append(i.city)
            }
            for i in location.Chhattisgarh{
                locationArray.append(i.city)
            }
            for i in location.Gujarat{
                locationArray.append(i.city)
            }
            for i in location.Haryana{
                locationArray.append(i.city)
            }
            for i in location.Karnataka{
                locationArray.append(i.city)
            }
            for i in location.Rajasthan{
                locationArray.append(i.city)
            }
            for i in location.Kerala{
                locationArray.append(i.city)
            }
            for i in location.WestBengal{
                locationArray.append(i.city)
            }
            for i in location.MadhyaPradesh{
                locationArray.append(i.city)
            }
            for i in location.Tripura{
                locationArray.append(i.city)
            }
            for i in location.Odisha{
                locationArray.append(i.city)
            }
            for i in location.Puducherry{
                locationArray.append(i.city)
            }
            for i in location.Punjab{
                locationArray.append(i.city)
            }
            
            for i in location.Karnatka{
                locationArray.append(i.city)
            }
            for i in location.TamilNadu{
                locationArray.append(i.city)
            }
            return locationArray
        }
        catch{
            print(error.localizedDescription)
        }
        return locationArray
    }
}
