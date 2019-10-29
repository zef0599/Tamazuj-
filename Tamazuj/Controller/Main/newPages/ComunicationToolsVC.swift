//
//  ComunicationToolsVC.swift
//  Tamazuj
//
//  Created by yousef Omar on 10/27/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
struct comData {
    var image:UIImage?
    var title:String?
}
class ComunicationToolsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var array:[comData] = [
    comData(image:#imageLiteral(resourceName: "video.png"), title: "مكالمة فيديو"),
    comData(image:#imageLiteral(resourceName: "calling.png"), title: "مكالمة صوتية"),
    comData(image:#imageLiteral(resourceName: "chat.png"), title: "محادثة كتابية")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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
        return cell
        
    }
    
}
