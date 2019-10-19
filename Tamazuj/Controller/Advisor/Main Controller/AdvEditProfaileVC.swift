//
//  AdvEditProfaileVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/19/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class AdvEditProfaileVC: UIViewController {
    
    let gender = ["ذكر","انثى"]
    var selectedGender:String?
    
    let degree = ["bachelor degree",
                  "magister degree",
                  "doctorate degree"]
    var selectedDegree: String?
    
    let relation = ["Marriage",
                    "Divorced",
                    "single"]
    var selectedRelation: String?
    
    var countries: [String] = []
    var selectedCountry: String?
    
    
    
    @IBOutlet weak var profilImage: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var hederEmail: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var pickerGender: UIPickerView!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var educationTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var relationTextField: UITextField!
    var profileData:AdvProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDegreePicker()
        createGenderPicker()
        createRelationPicker()
        createCountriesPicker()
//        preAdvProfile()
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "ar_SA").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
        self.showIndeterminateHUD()
        Operation.advgetProfile(Authorization: "Bearer \(helper.getApiToken()!)", lang: "ar") { (error, result) in
            if let result = result {
                self.profileData = result
                self.hideHUD()
                self.profilImage.kf.setImage(with: URL(string: (result.data?.photo)!))
                self.nameTextfield.text = result.data?.name
                self.headerName.text = result.data?.name
                self.emailTextField.text = result.data?.email
                self.hederEmail.text = result.data?.email
                self.phoneTextField.text = self.profileData?.data?.phone
                self.genderTextField.text = self.profileData?.data?.gender
                self.nationalityTextField.text = self.profileData?.data?.nationality
                self.birthDateTextField.text = self.profileData?.data?.date_of_birth
                self.educationTextField.text = self.profileData?.data?.degree
                self.jobTextField.text = self.profileData?.data?.current_job
                self.relationTextField.text = result.data?.social_status
                print(result)
                print("Bearer \(helper.getApiToken()!)")
                
            }
        }
    }
    func preAdvProfile() {
        self.profilImage.kf.setImage(with: URL(string: (profileData?.data?.photo)!))
        self.nameTextfield.text = profileData?.data?.name
        self.headerName.text = profileData?.data?.name
        self.emailTextField.text = profileData?.data?.email
        self.hederEmail.text = profileData?.data?.email
        self.phoneTextField.text = profileData?.data?.phone
        self.genderTextField.text = profileData?.data?.gender
        self.nationalityTextField.text = profileData?.data?.nationality
        self.birthDateTextField.text = profileData?.data?.date_of_birth
        self.educationTextField.text = profileData?.data?.degree
        self.jobTextField.text = profileData?.data?.current_job
        self.relationTextField.text = profileData?.data?.social_status

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
    // MARK:- Creat pickers
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
    
// MARK:-

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func changeImage(_ sender: Any) {
        //pick image
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submetButton(_ sender: Any) {
        self.showIndeterminateHUD()
        if self.nameTextfield.text != nil{
            
            Operation.AdvEditeProfile(Authorization: "Bearer \(helper.getApiToken()!)", lang: "ar", name: self.nameTextfield.text!, gender: self.selectedGender ?? "", nationality: self.nationalityTextField.text ?? "" , work_status: self.jobTextField.text ?? "", social_status: self.relationTextField.text ?? "", educational_status: self.educationTextField.text ?? "", photo: "T##String", fcm_token: "", os_type: 1, date_of_birth: self.birthDateTextField.text ?? "" ) { (error, result) in
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
                    self.educationTextField.text = result.data?.degree
                    self.jobTextField.text = result.data?.current_job
                    self.relationTextField.text = result.data?.social_status
                    print("the national:"+(result.data?.nationality)!)
                }
                
                
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)

        
    }
}
extension AdvEditProfaileVC: UIPickerViewDelegate, UIPickerViewDataSource {
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
            return countries[row]
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
            nationalityTextField.text = selectedCountry
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
            label.text = countries[row]
        }
        
        return label
    }
    
    
}
