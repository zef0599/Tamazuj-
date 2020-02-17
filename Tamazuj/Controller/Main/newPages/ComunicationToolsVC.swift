//
//  ComunicationToolsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit

class ComunicationToolsVC: UIViewController {
    var delegate:timeComunicationTool?
    
    @IBOutlet weak var tableView: UITableView!
    var array:[contactData] = [
    contactData(image:#imageLiteral(resourceName: "video.png"), title: "مكالمة فيديو"),
    contactData(image:#imageLiteral(resourceName: "calling.png"), title: "مكالمة صوتية"),
    contactData(image:#imageLiteral(resourceName: "chat.png"), title: "محادثة كتابية")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationItem.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        //        self.navigationController?.navigationBar.isHidden = false
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
        //        self.navigationController?.navigationBar.isHidden = false
    }



}
extension ComunicationToolsVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comunicationCell", for: indexPath) as! comunicationCell
        let obj = array[indexPath.row]
        cell.IconImage.image = obj.image
        cell.titleLabel.text = obj.title
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectionComunicationTool(contact: array[indexPath.row])
        navigationController?.popViewController(animated: true)
    
    }
}
