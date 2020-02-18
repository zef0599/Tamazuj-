
import UIKit
import Kingfisher
import Firebase

class RequistConsaltationVCX: UIViewController, UITextViewDelegate {
    
    var reqData:Single?
    var data : [ConsaltantData]?
    var Alldata : [ConsaltantData] = []
    var consaltant:datatestme?
    var category:datatestme.DataCategory?
    var supCategory:datatestme.supCategory?
    var index:Int?
    var time:String?
    var contact:contactData?
    var nav:UINavigationController?
    var supName:String?
    var isSupExist:Bool = false
    var supId:String?
    var timeInt:Int?
    var consaltantBackFromSelectConsaltant:datatestme.Consultant?
    var selectedConsaltantId:Int?
    
    @IBOutlet weak var details: UITextView!
    @IBOutlet weak var askConalt: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(self.reqData,"self.reqDataself.reqDataself.reqData")
        //        if supCategory == nil  {
        //            self.category = reqData!.data.category![0]
        //        }else if category == nil {
        //            self.category = reqData!.data.category![0]
        //        }
        if let reqestedData = reqData?.data.category {
        }else{
            print("thire is no data in reqData?.data.category")
        }
        
        
        
        tableView.isScrollEnabled = false
        details.text = "بعض التفاصيل عن المشكلة"
        details.textColor = UIColor.lightGray
        details.font = UIFont(name: "Cairo-Regular", size: 14.0)
        details.returnKeyType = .done
        details.delegate = self
        
        
        let data = ["mohammed":"ali"]
        Database.database().reference().child("test").setValue(data)
    }
    
    func fillData(){
        guard let reqData = reqData?.data.category![0] else {return}
        self.category = reqData
        
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
    
    @IBAction func askConsalt(_ sender: Any) {
        if let categoryId = category?.id {
            print("categoryIdcategoryIdcategoryId")
            print(categoryId)
        }
        if let consultantId = selectedConsaltantId {
            print("consultantIdconsultantIdconsultantId")
            print(consultantId)
        }
        if let consultantIdFromConsaltantObject = consaltantBackFromSelectConsaltant?.id {
            print("consultantIdFromConsaltantObject")
            print(consultantIdFromConsaltantObject)
            
        }
        if let communication = contact?.title {
            print("communicationcommunication")
            print(communication)
        }
        if let timeInts = timeInt {
            print("timeInttimeInttimeInt")
            print(timeInts)
        }
        
        guard let communication = contact?.title,
            let problem = details.text,
            let time = timeInt,
            let categoryId = category?.id,
            let consultantId = self.selectedConsaltantId
            else {
                return showHUD(title: "عذرا", details: "يرجى تعبئه جميع الحقول", hideAfter: 1)}
        
        var subCategoryId = supId
        
        showHUD(title: "waiting...")
        Operation.askConsalt(communication: communication, problem: problem, time: timeInt!, categoryId:categoryId , consultantId: consultantId, subCategoryId: nil, status: nil) { (error, result) in
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
extension RequistConsaltationVCX:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as requistConsTableViewCell
        
        switch indexPath.row {
        case 0:
            
            if let object:Single = reqData {
                cell.iconImage.isHidden = false
                
                if (self.supCategory != nil)  {
                    guard let categoryName = self.category?.name_ar, let supname  = self.supCategory?.name_ar else{return UITableViewCell()}
                    print(categoryName,supname,"self.supCategory != nil")
                    
                    cell.titleLabel.text = "\(categoryName) \n \(supname)"//  \n \(supname )
                }else if category != nil  {
                    guard let categoryName = self.category?.name_ar else{return UITableViewCell()}
                    print(categoryName,supCategory?.name_ar,"selfselfnnnnnnn")
                    
                    
                    cell.titleLabel.text = "\(categoryName) "
                }else{
                    cell.titleLabel.text = "لا يوجد تصنيفات للمستشار"
                }
                
                guard let image = category?.image else {return cell}
                cell.iconImage.kf.setImage(with: URL(string: image))
                // FIXME: fix category sent to data
                //                self.category = reqData?.data.category![0]
                //                self.consaltant = reqData?.data
                
            }else{
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "اختر مجال الاستشارة"
            }
            
        case 1:
            
            if consaltantBackFromSelectConsaltant != nil {
                cell.iconImage.isHidden = false
                cell.iconImage.kf.setImage(with: URL(string:consaltantBackFromSelectConsaltant!.photo!))
                cell.titleLabel.text = consaltantBackFromSelectConsaltant?.name!
                
            }else if let object:Single = reqData{
                cell.iconImage.isHidden = false
                cell.iconImage.kf.setImage(with: URL(string:object.data.photo!))
                cell.titleLabel.text = object.data.name
            }else{
                cell.iconImage.isHidden = true
                cell.titleLabel.text = "اختر المستشار"
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
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseCategoryVCX") as! ChooseCategoryVCX
            vc.delegate = self
            vc.reqData = self.reqData
            let object:Single = reqData!
            if object.data.sup_category!.count > 0  {
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else if object.data.category!.count > 0 {
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else{
                return
            }
            
            
        case 1:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseConsaltantVCX") as! ChooseConsaltantVCX
            vc.delegate = self
            vc.reqData = self.reqData
            self.navigationController?.pushViewController(vc, animated: true)
            
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
extension RequistConsaltationVCX: SelectionDelegateX {
    func selectionReady(category: datatestme.DataCategory,supCategory:datatestme.supCategory, supName: String, supId: String) {
        self.isSupExist = true
        self.category = category
        self.supCategory = supCategory
        self.supName = supName
        self.supId = supId
        self.tableView.reloadData()
    }
    func selectionReady(category: datatestme.DataCategory) {
        if category.sup_category!.count > 0 {
            self.isSupExist = true
            self.supId = "\(category.sup_category![0].id)"
        }else{self.isSupExist = false}
        self.category = category
        self.supCategory = nil
        self.tableView.reloadData()
    }
    
    func selectionConsaltntReady(consaltantId:Int,conaltantModel:datatestme.Consultant) {
        self.consaltantBackFromSelectConsaltant = conaltantModel
        self.selectedConsaltantId = consaltantId
        self.tableView.reloadData()
    }
    
    
}
extension RequistConsaltationVCX: timeComunicationTool {
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
