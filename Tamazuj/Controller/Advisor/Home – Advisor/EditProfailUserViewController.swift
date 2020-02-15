//
//  EditProfailUserViewController.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 20/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase
struct countrieeee {
    let title:String
    let countrieId:Int
}

class EditProfailUserViewController: UIViewController {
    
    let gender = ["male","female"]
    var selectedGender:String?
    
    let degree = ["bachelor degree",
                  "magister degree",
                  "doctorate degree"]
    var selectedDegree: String?
    
    let relation = ["Marriage",
                    "Divorced",
                    "single"]
    var selectedRelation: String?
    var countries: [countrieeee] = [
        countrieeee(title:"Saudi Arabia", countrieId:4),
        countrieeee(title:"Jordan", countrieId: 5),
        countrieeee(title:"Palestine", countrieId: 6),
        countrieeee(title:"UAE", countrieId: 7)]
    var selectedCountry: countrieeee?

    
//    var countries: [String] = []
//    var selectedCountry: String?
    
    
    
    //TODO:-shouldChangeCharactersIn
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
//        return string.rangeOfCharacter(from: invalidCharacters) == nil
//    }
    
    
    @IBOutlet weak var profilImage: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var hederEmail: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
//    @IBOutlet weak var pickerGender: UIPickerView!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var relationTextField: UITextField!
    var profileData:Profile?
    let picker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDateTextField.inputView = picker
        picker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donebutton))
        setToolbarItems([done], animated: true)
        picker.addTarget(self, action: #selector(datechange), for:.valueChanged )
        
        let weekago = Calendar.current.date(byAdding: .day,value: -7, to: Date())
        let weeklater = Calendar.current.date(byAdding: .day,value: 7, to: Date())
       // picker.maximumDate = weeklater
     //   picker.minimumDate = weekago
       // picker.date = weekago!
        createDegreePicker()
        createGenderPicker()
        createRelationPicker()
        createCountriesPicker()
        
//        for code in NSLocale.isoCountryCodes  {
//            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
//            let name = NSLocale(localeIdentifier: "ar_SA").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
//            countries.append(name)
//        }
        
        self.showIndeterminateHUD()
        Operation.getProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (error, result) in
            if let result = result {
                self.profileData = result
                self.hideHUD()
                self.profilImage.kf.setImage(with: URL(string: (result.data?.photo)!))
                self.nameTextfield.text = result.data?.name
                self.headerName.text = result.data?.name
                self.emailTextField.text = result.data?.email
                self.hederEmail.text = result.data?.email
                self.phoneTextField.text = result.data?.phone
                self.genderTextField.text = result.data?.gender
                self.nationalityTextField.text = result.data?.nationality
                self.birthDateTextField.text = result.data?.date_of_birth
                self.educationTextField.text = result.data?.educational_status
                self.jobTextField.text = result.data?.work_status
                self.relationTextField.text = result.data?.social_status
                
                
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    @objc func donebutton(){
        getDate()
    }
    @objc func datechange(){
        getDate()

    }
    func getDate(){
        
        let formmat = DateFormatter()
        formmat.dateFormat = "dd.MM.yyy"
        self.birthDateTextField.text = formmat.string(from: picker.date)
    }
    func createGenderPicker() {
        
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        genderPicker.tag = 0
        genderTextField.inputView = genderPicker
        //Customizations
        //        genderPicker.backgroundColor = .black
    }
    
    
    func createDegreePicker() {
        
        let degreePicker = UIPickerView()
        degreePicker.delegate = self
        degreePicker.tag = 1
        educationTextField.inputView = degreePicker
    }
    func createRelationPicker() {
        
        let RelationPicker = UIPickerView()
        RelationPicker.delegate = self
        RelationPicker.tag = 2
        relationTextField.inputView = RelationPicker
    }
    func createCountriesPicker() {
        
        let countriesPicker = UIPickerView()
        countriesPicker.delegate = self
        countriesPicker.tag = 3
        nationalityTextField.inputView = countriesPicker
    }
    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        educationTextField.inputAccessoryView = toolBar
        genderTextField.inputAccessoryView = toolBar
        relationTextField.inputAccessoryView = toolBar
        nationalityTextField.inputAccessoryView = toolBar
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func changeImage(_ sender: Any) {
        //pick image
    }
    
    @IBAction func back(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
        navigationController?.popViewController {
            Operation.getProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar") { (error, result) in
                if let result = result {
                    self.profileData = result
                    let storu = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storu.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//                    vc.tableView.reloadData()
                    self.hideHUD()
                    
                }
            }

        }
    }
    
    @IBAction func submetButton(_ sender: Any) {
        
        
        
        if self.nameTextfield.text != nil{
            
            
//            InstanceID.instanceID().instanceID { (result, error) in
//                if let error = error {
//
//                    print("Error fetching remote instance ID: \(error)")
//                } else if let result = result {
//                    print("Remote instance ID token: \(result.token)")
//                    //                self.instanceIDTokenMessage.text  = "Remote InstanceID token: \(result.token)"
            //                }// self.nameTextfield.text = result.data?.name
//            self.headerName.text = result.data?.name
//            self.emailTextField.text = result.data?.email
//            self.hederEmail.text = result.data?.email
//            self.phoneTextField.text = result.data?.phone
//            self.genderTextField.text = result.data?.gender
//            self.nationalityTextField.text = result.data?.nationality
//            self.birthDateTextField.text = result.data?.date_of_birth
//            self.educationTextField.text = result.data?.educational_status
//            self.jobTextField.text = result.data?.work_status
//            self.relationTextField.text = result.data?.social_status
                guard  let name = self.nameTextfield.text , !name.isEmpty else {
                        self.showHUD(title: "", details: "enter youer name", hideAfter: 3)
                    return}
                guard  let gender = self.genderTextField.text , !gender.isEmpty else {
                    self.showHUD(title: "", details: "enter youer gender", hideAfter: 3)
                    return}
                guard  let nationality = self.nationalityTextField.text , !nationality.isEmpty else {
                    self.showHUD(title: "", details: "enter nationality", hideAfter: 3)
                    return}
                guard  let job = self.jobTextField.text , !job.isEmpty else {
                    self.showHUD(title: "", details: "enter job", hideAfter: 3)
                    return}
                guard  let relation = self.relationTextField.text , !relation.isEmpty else {
                    self.showHUD(title: "", details: "enter relation", hideAfter: 3)
                    return}
                guard  let education = self.educationTextField.text, !education.isEmpty else {
                    self.showHUD(title: "", details: "enter education", hideAfter: 3)
                    return}
                guard  let birthDate = self.birthDateTextField.text , !birthDate.isEmpty else {
                    self.showHUD(title: "", details: "enter birthDate   ١", hideAfter: 3)
                    return}
            
            
            
//            }
            
           
            
            self.showIndeterminateHUD()
            Operation.changeProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar", name: name, gender: gender, nationality: nationality  , work_status: job, social_status: relation, educational_status: job , photo: "T##String", fcm_token: "token", os_type: 1, date_of_birth: birthDate ) { (error, result) in
                    
                if let result = result {
                    self.profileData = result
                    self.hideHUD()
                    self.nameTextfield.text = result.data?.name
                    self.headerName.text = result.data?.name
                    self.emailTextField.text = result.data?.email
                    self.hederEmail.text = result.data?.email
                    self.phoneTextField.text = result.data?.phone
                    self.genderTextField.text = result.data?.gender
                    self.nationalityTextField.text = result.data?.nationality
                    self.birthDateTextField.text = result.data?.date_of_birth
                    self.educationTextField.text = result.data?.educational_status
                    self.jobTextField.text = result.data?.work_status
                    self.relationTextField.text = result.data?.social_status
                }
                
            }
        }
        
    }
        
//}
}


extension EditProfailUserViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return gender.count
        }else if pickerView.tag == 1{
            return degree.count
        }else if pickerView.tag == 2{
            return relation.count
        }else{
            return countries.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return gender[row]
        }else if pickerView.tag == 1{
            return degree[row]
            
        }else if pickerView.tag == 2{
            return relation[row]
        }else{
            return countries[row].title
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            self.selectedGender = gender[row]
            genderTextField.text = selectedGender
            
        }else if pickerView.tag == 1{
            self.selectedDegree = degree[row]
            educationTextField.text = selectedDegree
        }else if pickerView.tag == 2{
            self.selectedRelation = relation[row]
            relationTextField.text = selectedRelation
        }else{
            self.selectedCountry = countries[row]
            nationalityTextField.text = selectedCountry?.title
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        //        label.textColor = .green
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        if pickerView.tag == 0 {
            label.text = gender[row]
        }else if pickerView.tag == 1{
            label.text = degree[row]
        }else if pickerView.tag == 2{
            label.text = relation[row]
        }else{
            label.text = countries[row].title
        }
        
        return label
    }
    
    
}


