
import UIKit
import Kingfisher
import Firebase

struct contactData {
    var image:UIImage?
    var title:String?
}
class RequistConsaltationVC: UIViewController, UITextViewDelegate {

    var consaltant:Category.Consultant?
    var category:data?
    var index:Int?
    var time:String?
    var contact:contactData?
    var nav:UINavigationController?
    var supName:String?
    var isSupExist:Bool = false
    var supId:String?
    var timeInt:Int?
        /*
    var tableData:[reqData] = [
    reqData(image: #imageLiteral(resourceName: "category_menu_icon2.png"),title: "استشارات أسرية \nتصنيف فرعي" ),
    reqData(image: #imageLiteral(resourceName: "person"), title: "عبد الله محمد عمر"),
    reqData(image: nil, title: nil),
    reqData(image: #imageLiteral(resourceName: "video.png"), title: "مكالمة فيديو")
    ]
    */
    
    @IBOutlet weak var details: UITextView!
    @IBOutlet weak var askConalt: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
        details.text = "بعض التفاصيل عن المشكلة"
        details.textColor = UIColor.lightGray
        details.font = UIFont(name: "Cairo-Regular", size: 14.0)
        details.returnKeyType = .done
        details.delegate = self

        
//        let data = ["mohammed":"ali"]
//        Database.database().reference().child("test").setValue(data)
        
        

    }
    
    
    // add to fix nav bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        //        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        //        self.navigationController?.setNavigationBarHidden(false, animated: false)
//        self.navigationController?.isNavigationBarHidden = true
        // - fix duble nav + change nav back image + title
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back.png")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back.png")


        
    }


    

    
    
//    override func viewWillAppear(_ animated: Bool) {
//        print("qqqqqqqq",consaltant)
//    }
        //MARK:- UITextViewDelegates
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "بعض التفاصيل عن المشكلة" {
            textView.text = ""
            textView.textColor = UIColor.black
            textView.font = UIFont(name: "Cairo-Regular", size: 14.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "بعض التفاصيل عن المشكلة"
            textView.textColor = UIColor.lightGray
            textView.font = UIFont(name: "Cairo-Regular", size: 14.0)
        }
    }

    
    @IBAction func exite(_ sender: Any){
        nav?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
        
    }
    //MARK:- button askConsalt
    
//    fileprivate func AddnewUserAndFirstmasseg() {
//        // return the message and the status to the hud
//
//
//        //MARK:- add to fierbase user and consaltnt
//        /// get user to send firbase
//        Operation.getProfile(Authorization: "Bearer \(helper.getUserToken()!)", lang: "ar", completion: { (error,result) in
//            if let result = result ,result.meta.status == 1{
//
//                ////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                ////////////// save user
//                guard let email = result.data?.email ,let name = result.data?.name , let number = result.data?.phone , let photo  = result.data?.photo  else{ return}
//                FirebaseRealTime.addNewUser(number: number, name: name, image: photo,email: email ,compltion: { (bool) in
//                    if bool{
//                    }else{
//                        self.showHUD(title: "", details: "some error in add user( askConsalt)", hideAfter: 3)
//                    }
//                })
//
//                /// get consaltant to send firbase
//                guard let emailC = self.consaltant?.email,let numberC = self.consaltant?.phone ,let nameC = self.consaltant?.name else {return}
//
//                FirebaseRealTime.addNewUser(number: numberC, name: nameC, image: nil,email: emailC ,compltion: { (bool) in
//                    if bool{
//                    }else{
//                        self.showHUD(title: "", details: "some error in add user( usrConsalt)", hideAfter: 3)
//                    }
//
//
//                    ///  add usr and consaltnt to masseg and send first masseg  firbase
//                    FirebaseRealTime.addmasseges(numberConsaltnt: numberC, numberUser: number, masseg: "test", recipientName: nameC, senderName: name, compltion: { (bol) in
//                        if bol{
//
//                        }else{
//                            self.showHUD(title: "", details: "some error in send data", hideAfter: 3)
//                        }
//                    })
//
//
//                })
//            }else{
//                self.showHUD(title: "", details: "some error", hideAfter: 3)
//            }
//
//
//
//            ////////////////////////////////////////////////////////////////////////////////////////////////////
//
//        })
//    }
    
    @IBAction func askConsalt(_ sender: Any) {
        
        
        guard let communication = contact?.title,
            let problem = details.text,
            let time = timeInt,
            let categoryId = category?.id,
            let consultantId = consaltant?.id
            else {return showHUD(title: "عذرا", details: "يرجى تعبئه جميع الحقول", hideAfter: 1)}
        
        var subCategoryId = supId
        
        showHUD(title: "waiting...")
        Operation.askConsalt(communication: communication, problem: problem, time: time, categoryId:categoryId , consultantId: consultantId, subCategoryId: subCategoryId, status: nil) { (error, result) in
            if let result = result {
                self.hideHUD()
                
                
//                self.AddnewUserAndFirstmasseg()
                // return the message and the status to the hud
                print("result")
                print(result)
                let alert = UIAlertController(title: "حالة الطلب", message: result.message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "موافق", style: .default, handler: { (action) in
//                    self.navigationController?.popViewController(animated: true)
                    
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chatViewController") as! chatViewController
                    // as test
                    vc.id = 3
                    
                    self.present(vc, animated: true, completion: nil)
                }))
                
                self.present(alert, animated: true)
            }
        }
        //        self.navigationController?.popViewController(animated: true)
    }
    
    func handelerReqCons() {
        print("handeler \n\n")
    }
}
extension RequistConsaltationVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as requistConsTableViewCell
        
        switch indexPath.row {
        case 0:
            if category == nil {
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "اختر مجال الاستشارة"
            }else{
                cell.iconImage.isHidden = false
                if isSupExist {
                    cell.titleLabel.text = "\(category!.name_ar!) \n \(self.supName ?? "no sup")"
                }else{
                    cell.titleLabel.text = "\(category!.name_ar!)"
                }
                cell.iconImage.kf.setImage(with: URL(string: "\(category!.image!)"))
            }
        case 1:
            if consaltant == nil {
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "اختر المستشار"
            }else{
                cell.iconImage.isHidden = false
                cell.iconImage.kf.setImage(with: URL(string:consaltant!.photo!))
                cell.titleLabel.text = consaltant?.name
            }
        case 2:
            if time == nil {
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "حدد المدة الزمنية"
            }else{
                cell.iconImage.isHidden = true
                cell.titleLabel.text = time
            }
        case 3:
            if contact == nil {
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "اختر طريقة التواصل مع المستشار"
            }else{
                cell.iconImage.isHidden = false
                cell.iconImage.image = contact?.image
                cell.titleLabel.text = contact?.title
            }
        default:
            if contact == nil {
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "اختر طريقة التواصل مع المستشار"
            }else{
                cell.iconImage.image = contact?.image
                cell.titleLabel.text = contact?.title
            }

        }


        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if category != nil{
                return 107
            }
        }
        return 86
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
//             if category 	== nil {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseCategoryVC") as! ChooseCategoryVC
                vc.delegate = self
                self.navigationController?.pushViewController(vc, animated: true)
//             }else{
//                self.showHUD(title: "", details:  " تم اختر مجال الاستشارة", hideAfter: 3)
//             }
            
        case 1:
            if self.category?.consultant == nil {
                self.showHUD(title: "", details:  "اختر مجال الاستشارة", hideAfter: 3)
            }else{
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseConsaltantVC") as! ChooseConsaltantVC
                vc.delegate = self
                vc.allConsaltant = self.category!.consultant!
                self.navigationController?.pushViewController(vc, animated: true)
            }
            


        case 2:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectTime") as! SelectTime
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)

        case 3:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ComunicationToolsVC") as! ComunicationToolsVC
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)

        default:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "categorySelectionVC") as! categorySelectionVC
            self.navigationController?.pushViewController(vc, animated: true)

            
        }

    }
}
extension RequistConsaltationVC: SelectionDelegate {
    func selectionReady(category: data, supName: String,supId:String) {
        self.isSupExist = true
        self.category = category
        self.supName = supName
        self.supId = supId
        self.tableView.reloadData()
        
    }
    func selectionReady(category: data) {
        self.isSupExist = false
        self.category = category
        self.supId = nil
        self.tableView.reloadData()
        
    }

    func selectionConsaltntReady(consaltant:Category.Consultant) {
        self.consaltant = consaltant
        self.tableView.reloadData()
    }

}
extension RequistConsaltationVC: timeComunicationTool {
    func selectionTime(time: String,minute:Int) {
        self.time = time
        self.timeInt = minute
        self.tableView.reloadData()
        
    }
    func selectionComunicationTool(contact: contactData) {
        self.contact = contact
        print(contact)
        self.tableView.reloadData()
        
    }

}
