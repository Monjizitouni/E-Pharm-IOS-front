//
//  Panier.swift
//  E-Pharm
//
//  Created by Mac-Mini_2021 on 12/04/2022.
//

import UIKit

class Panier: UIViewController, UICollectionViewDataSource {
    
    
    //var
    
    var NameMed:String?
    var med = ["zink", "gripex", "vitamin", "asprine", "parac", "para","fervex"]
    var medimage = ["zink", "gripex", "vitamin", "asprine", "parac", "para","fervex"]
    var categ = ["douleur", "fiver", "douleur", "douleur", "vitamin", "nutrition","fiver"]
    var prix = ["25DT", "20DT", "15DT", "30DT", "45DT", "30DT","40DT"]
    
    
    @IBOutlet weak var mcollectinView: UICollectionView!
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return med.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mitem", for: indexPath )
        let cv = cell.contentView
        let medImg = cv.viewWithTag(1) as! UIImageView
        let medname = cv.viewWithTag(2) as! UILabel
        let cat = cv.viewWithTag(3) as! UILabel
        let prixmed = cv.viewWithTag(4) as! UILabel
        
        medImg.image = UIImage(named:medimage[indexPath.row])
        medname.text = med[indexPath.row]
        prixmed.text = prix[indexPath.row]
        cat.text = categ[indexPath.row]
        return cell
    }
    
  
    
   
    //Widget
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
