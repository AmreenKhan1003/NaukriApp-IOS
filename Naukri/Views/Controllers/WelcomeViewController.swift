//
//  WelcomeViewController.swift
//  Naukri
//
//  Created by Capgemini-DA073 on 12/6/22.
//

import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {
    var passId = SideMenuPass()
    //sidebarview
    @IBOutlet weak var sideBarView: UIView!
    
    @IBOutlet weak var profileSideView: ProfileSideBarView!
    
    @IBOutlet weak var sideBarItemsView: sideBarItems!
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var skillsTextField: UITextField!
    @IBOutlet weak var locationTableView: UITableView!
    @IBOutlet weak var skillsTableView: UITableView!
    var searchSkills = false
    var searchLocation = false
    var filteredLocation = [String]()
    var filteredSkills = [String]()
    let skillsArray = ParseJSON().fetchSkills()
    let locationArray = ParseJSON().fetchLocations()
    
    @IBOutlet weak var Jobs: UIView!
    @IBOutlet weak var LoginButton: UIButton!

    @IBOutlet weak var sponsoredCollectionView: UICollectionView!
    @IBOutlet weak var featureButtonsCollectionView: UICollectionView!
    @IBOutlet weak var featureCollectionView: UICollectionView!
    
    @IBOutlet weak var sponsoredButtonsCollectionView: UICollectionView!
    var logoImages: [String] = ["Oracle","Adani","Capgemini","WNS","Xoriant","AppliedMaterials"]
    var companyNames: [String] = ["Oracle","Adani","Capgemini","WNS","Xoriant","Applied Materials"]
    var abouts: [String] = ["Cloud technology company since 1977","A leading integrated business conglomerate enriching lives","A global leader in consulting, technology services and digital transformation ","Leading business process management company","Software development & technology services firm","Leader in materials engineering solutions"]
    var ratings: [String] = ["3.9","4.1","4.5","3.7","4.3","4.2"]
    var reviews: [String] = ["4.0K+ reviews","4.5K+ reviews", "9.5K+ reviews", "7.1K+ reviews", "9.0K+ reviews"," 5.0K+ reviews"]
    var Labels: [String] = ["IT Sevices", "BFSI", "Technology", "BPM"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        // Do any additional setup after loading the view.
        LoginButton.layer.borderWidth = 1
        LoginButton.layer.borderColor = UIColor.blue.cgColor
        LoginButton.layer.cornerRadius = 20
        navigationItem.hidesBackButton = true
        
        featureCollectionView.delegate = self
        featureCollectionView.dataSource = self
        
        let nibCell = UINib(nibName: "JobCollectionViewCell", bundle: nil)
         featureCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        
        featureButtonsCollectionView.delegate = self
        featureButtonsCollectionView.dataSource = self
        //featureCollectionView.reloadData()
        
        let nibCellButton = UINib(nibName: "OptionsCollectionViewCell", bundle: nil)
        featureButtonsCollectionView.register(nibCellButton, forCellWithReuseIdentifier: "Cell")
       
        sponsoredButtonsCollectionView.delegate = self
        sponsoredButtonsCollectionView.dataSource = self
        
        let nibsponButton = UINib(nibName: "OptionsCollectionViewCell", bundle: nil)
        sponsoredButtonsCollectionView.register(nibsponButton, forCellWithReuseIdentifier: "Cell")
        
        sponsoredCollectionView.delegate = self
        sponsoredCollectionView.dataSource = self
        
        let nibspon = UINib(nibName: "JobCollectionViewCell", bundle: nil)
        sponsoredCollectionView.register(nibspon, forCellWithReuseIdentifier: "cell")
        
        skillsTableView.isHidden = true
        skillsTextField.delegate = self
        skillsTextField.addTarget(self, action: #selector(searchSkillsRecord), for: .editingChanged)
        
        locationTableView.isHidden = true
        locationTextField.delegate = self
        locationTextField.addTarget(self, action: #selector(searchLocationRecord), for: .editingChanged)
        
        skillsTableView.delegate = self
        skillsTableView.dataSource = self
        
        locationTableView.delegate = self
        locationTableView.dataSource = self
    }
   
    @IBAction func loginButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.whichOne = 0
        //self.push(nextViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func searchSkillsRecord(sender: UITextField){
        
        self.filteredSkills.removeAll()
        let numberSearchSkills: Int = skillsTextField.text!.count
        
        if numberSearchSkills != 0{
            
            searchSkills = true
            skillsTableView.isHidden = false
            
            for skill in skillsArray{
                
                if let skillsToSearch = skillsTextField.text{
                    
                    let range = skill.description.lowercased().range(of: skillsToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil{
                        self.filteredSkills.append(skill)
                        //print(filteredSkills)
                    }
                }
            }//end of for
            
        }
        else{
            skillsTableView.isHidden = true
            searchSkills = false
        }
        skillsTableView.reloadData()
    }
    
    @objc func searchLocationRecord(sender: UITextField){
        
        self.filteredLocation.removeAll()
        
        let numberSearchLocations: Int = locationTextField.text!.count
        
        if numberSearchLocations != 0{
            
            searchLocation = true
            locationTableView.isHidden = false
            
            for location in locationArray{
                
                if let locationsToSearch = locationTextField.text{
                    
                    let range = location.description.lowercased().range(of: locationsToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil{
                        self.filteredLocation.append(location)
                        
                    }
                }
            }//end of for
            
        }
        else{
            locationTableView.isHidden = true
            searchLocation = false
        }
        locationTableView.reloadData()
    }//End of func
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        skillsTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        sideBarView.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        Jobs.backgroundColor = UIColor.white
        let logtype = UserOnCoreData()
        if logtype.checkLogType() == true{
            Jobs.isHidden = false
        }
        else{
            Jobs.isHidden = true
        }
    }
    
    override func viewWillLayoutSubviews() {
        
        
        let viewid = passId.passData()
        SideMenuPass.whichView = 0
        //print(viewid)
        //open storyboard
        if (viewid == 1){
            passId.addData(passid: 0)
            let storyBoard: UIStoryboard = UIStoryboard(name: "sideMenus", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "settings") as! SettingsViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        if (viewid == 2){
            passId.addData(passid: 0)
            let storyBoard: UIStoryboard = UIStoryboard(name: "sideMenus", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "jobseekers") as! JobSeekersViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    @IBAction func sideBarButtonClicked(_ sender: Any) {
        if sideBarView.isHidden == true{
            sideBarView.isHidden = false
            //Jobs.backgroundColor = UIColor.gray
            //sideBarView.backgroundColor = UIColor.white
        }
        else{
            sideBarView.isHidden = true
            //Jobs.backgroundColor = UIColor.white
        }
    }
    
}

extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featureCollectionView.self{
            return companyNames.count
        }
        if collectionView == sponsoredButtonsCollectionView.self{
            return Labels.count
        }
        if collectionView == sponsoredCollectionView.self{
            return companyNames.count
        }
        else{
            return Labels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == featureCollectionView.self{
            let cellA = featureCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JobCollectionViewCell
            cellA.logoImage.image = UIImage(named: logoImages[indexPath.row])
            cellA.companyName.text = companyNames[indexPath.row]
            cellA.about.text = abouts[indexPath.row]
            cellA.rating.text = ratings[indexPath.row]
            cellA.review.text = reviews[indexPath.row]
            return cellA
        }
        if collectionView == sponsoredButtonsCollectionView.self{
            let cellB = sponsoredButtonsCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! OptionsCollectionViewCell
            cellB.OptionLabel.text = Labels[indexPath.row]
            return cellB
        }
        
        if collectionView == sponsoredCollectionView{
            let cellA = sponsoredCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JobCollectionViewCell
            cellA.logoImage.image = UIImage(named: logoImages[indexPath.row])
            cellA.companyName.text = companyNames[indexPath.row]
            cellA.about.text = abouts[indexPath.row]
            cellA.rating.text = ratings[indexPath.row]
            cellA.review.text = reviews[indexPath.row]
            return cellA
        }
        
        else{
            let cellB = featureButtonsCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! OptionsCollectionViewCell
            cellB.OptionLabel.text = Labels[indexPath.row]
            return cellB
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchSkills{
            return filteredSkills.count
        }
        if searchLocation{
            
            return filteredLocation.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 =  skillsTableView.dequeueReusableCell(withIdentifier: "skillsCell", for: indexPath) as! SkillsTableViewCell
        let cell2 = locationTableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell

        if searchSkills{
            
            cell1.skillsLabel.text = filteredSkills[indexPath.row]
                        
            return cell1
        }

        else {
            cell2.locationLabel.text = filteredLocation[indexPath.row]
                return cell2
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchLocation{
            locationTableView.isHidden = true
            searchLocation = false
            let location = filteredLocation[indexPath.row]
            
            locationTextField.text = location

        }
        if searchSkills{
            skillsTableView.isHidden = true
            searchSkills = false
            let skill = filteredSkills[indexPath.row]
            
            skillsTextField.text = skill
        }
    }
    
}

