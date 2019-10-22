//
//  SliderCollictionTableViewCell.swift
//  Tamazuj
//
//  Created by Mohammed Erbia on 16/09/2019.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import Kingfisher

class SliderCollictionTableViewCell: UITableViewCell {
     var nav : UINavigationController?
    var bestRatingdata : [BestRating] = []

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    fileprivate var timer: Timer?
    var storyBoardVC = UIViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        collectionView.isTracking = false
//        collectionView.isScrollEnabled = false
        //self.navigationBar.isTranslucent = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "sliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sliderCollectionViewCell")
        
        startTimer()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /**
     Invokes Timer to start Automatic Animation with repeat enabled
     */
    fileprivate func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true)
        timer?.tolerance = 0.3
        
    }
    
    /**
     Scroll to Next Cell
     */
    @objc fileprivate func scrollToNextCell() {
        
        // get cell size
        let cellSize = collectionView.frame.size
        
        // get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        
        let x: CGFloat
        
        if collectionView.contentSize.width <= contentOffset.x + cellSize.width {
            x = 0.0
        } else {
            x = contentOffset.x + cellSize.width
        }
        
        let rect = CGRect(x: x, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
        collectionView.scrollRectToVisible(rect, animated: true)
        
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
extension SliderCollictionTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = self.bestRatingdata.count
        return self.bestRatingdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCollectionViewCell", for: indexPath) as! sliderCollectionViewCell
        let object = self.bestRatingdata[indexPath.row]
        
        cell.imageView.kf.setImage(with: URL(string: object.photo!))
        cell.titel.text = object.name!
        cell.reating.text = "\(object.rating ?? 0) %"
        cell.descriptioN.text =  object.biography ?? "لم يقم المستشار باضافة التفاصيل "
        self.collectionView.tag = indexPath.row
        cell.requestConsaltation.addTarget(self, action: #selector(Askadviceactione), for: .touchUpInside)

        
        return cell
    }
    // show the pop in nav by the nib buttom
    @objc func Askadviceactione (){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdvisorDetailsVC") as! AdvisorDetailsVC
        
        self.nav?.present(vc, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let o : CGSize = CGSize(width: 0.9, height: 0.9)
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height * 0.9)//collectionView.frame.size
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        timer?.invalidate()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        startTimer()
        
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl?.currentPage = currentPage
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl?.currentPage = currentPage
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let stprybord = UIStoryboard(name: "Main", bundle: nil)
//
//        let vc = stprybord.instantiateViewController(withIdentifier: "AboutAdvisorVC") as! UIViewController
//
//        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
//
//
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.bestRatingdata[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "abuteConsltentViewController") as! abuteConsltentViewController
        vc.id  = object.id!
//        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutContainerVC") as! AboutContainerVC
//            vc1.id = object.id
//        self.nav?.present(vc1, animated: false, completion: nil)
//
////            self.present(vc1, animated: true, completion: nil)
//
//
//
//        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewsContainer") as! ReviewsContainer
//        vc2.id = object.id
//        self.nav?.present(vc2, animated: false, completion: nil)
        
        
//        vc.id = object.id
        
//        print("hhhhhhh \(object.id!)")
        
//            self.nav?.present(vc, animated: true, completion: nil)
        self.nav?.pushViewController(vc, animated: true)
}

}
extension UIViewController{
    func hidnskeybored()  {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmiskeybored) )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmiskeybored() {
        
        view.endEditing(true)
    }
    
}
