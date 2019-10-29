
import UIKit
struct reqData {
    var image:UIImage?
    var title:String?
}
class RequistConsaltationVC: UIViewController, UITextViewDelegate {
    var consaltant:Consaltant?
    var category:category?
    var time:String?
    var contact:String?
    
    var tableData:[reqData] = [
    reqData(image: #imageLiteral(resourceName: "category_menu_icon2.png"),title: "استشارات أسرية \nتصنيف فرعي" ),
    reqData(image: #imageLiteral(resourceName: "person"), title: "عبد الله محمد عمر"),
    reqData(image: nil, title: nil),
    reqData(image: #imageLiteral(resourceName: "video.png"), title: "مكالمة فيديو")
    ]
    
    
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

        askConalt.setGradientBackground(colorOne: #colorLiteral(red: 0.3333333333, green: 0.768627451, blue: 0.8117647059, alpha: 1), colorTwo: #colorLiteral(red: 0.3333333333, green: 0.6392156863, blue: 0.8117647059, alpha: 1))
        askConalt.layer.cornerRadius = 15

    }
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
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func askConsalt(_ sender: Any) {

    }
    

}
extension RequistConsaltationVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as requistConsTableViewCell
        let obj = tableData[indexPath.row]
        if obj.image == nil {
            cell.iconImage.isHidden = true
        }else{
            cell.iconImage.image = obj.image
        }
        
        cell.titleLabel.text = obj.title
        guard  let image = tableData[indexPath.row].image,let title = tableData[indexPath.row].title  else {
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "اختر مجال الاستشارة"
            case 1:
                cell.titleLabel.text = "اختر المستشار"
            case 2:
                cell.titleLabel.text = "حدد المدة الزمنية"
            case 3:
                cell.titleLabel.text = "اختر طريقة التواصل مع المستشار"
            default:
                cell.titleLabel.text = "اختر مجال الاستشارة"
                
            }
            cell.selectionStyle = .none
            return cell
        }

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if tableData[0].title != nil{
                return 107
            }
        }
        return 86
    }
}
