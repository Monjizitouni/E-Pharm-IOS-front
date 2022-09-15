//
//  Description.swift
//  E-Pharm
//
//  Created by Mac-Mini_2021 on 12/04/2022.
//

import UIKit

class Description: UIViewController {
    
    //var
    var MedNames:String?
    var MedImages:String?
    
    
    //widget
    @IBOutlet weak var medImage: UIImageView!
    
    @IBOutlet weak var MedName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        medImage.image = UIImage(named: MedImages!)
        MedName.text = MedNames
        // Do any additional setup after loading the view.
    }
    func alertMethod(titre: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //IBAction
    
    @IBAction func AjouterAlert(_ sender: Any) {
        
        self.alertMethod(titre: "Warning", message: "Produit a ajouter avec succer !!")
    }
    

}
