//
//  searchPopup.swift
//  Tamazuj
//
//  Created by yousef Omar on 9/18/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class searchPopup: UIViewController {

    @IBOutlet weak var tableViewSearch: UITableView!
    @IBOutlet weak var searshTextField: UITextField!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contentView: UIView!
    
    
    let text:String = ""
    var data = ["هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة","2","3","4","5","6"]
    var filterdData = [String]()
    var isSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.cornerRadius = 13
        tableViewSearch.register(UINib(nibName: "searchCell", bundle: nil), forCellReuseIdentifier: "searchCell")

        searchBar.setImage(#imageLiteral(resourceName: "Search"), for: .search, state: .normal)

        searshTextField.borderStyle = .none
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    

    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil
        )
    }
    @IBOutlet weak var search: UIImageView!
}
extension searchPopup:UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filterdData.count
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableViewSearch.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? searchCell {
            let text:String!

            if isSearching {
                
                text = filterdData[indexPath.row]
            }else{
                text = data[indexPath.row]
            }
            cell.searchLable.text = text
            return cell
        }else{
            return UITableViewCell()
        }

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableViewSearch.reloadData()
        }else{
            isSearching = true
            filterdData = data.filter({$0 == searchBar.text})
            tableViewSearch.reloadData()
        }
    }
    
}


extension UIViewController {
    
    func showSearchPopup() {
        let searchPopupVC = searchPopup.init(nibName: "searchPopup", bundle: nil)
        //Present
        searchPopupVC.modalTransitionStyle = .crossDissolve
        searchPopupVC.modalPresentationStyle = .overCurrentContext
        self.present(searchPopupVC, animated: true, completion: nil)
    }
    

}
