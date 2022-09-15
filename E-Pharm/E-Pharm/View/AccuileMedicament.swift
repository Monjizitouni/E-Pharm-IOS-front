//
//  AccuileMedicament.swift
//  E-Pharm
//
//  Created by Mac-Mini_2021 on 11/04/2022.
//

import UIKit

class AccuileMedicament: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
  
    
    
    //var
    var NameMed:String?
    var med = ["zink", "gripex", "vitamin", "asprine", "parac", "para","fervex"]
    var medimage = ["zink", "gripex", "vitamin", "asprine", "parac", "para","fervex"]
    var categ = ["douleur", "fiver", "douleur", "douleur", "vitamin", "nutrition","fiver"]
    var prix = ["25DT", "20DT", "15DT", "30DT", "45DT", "30DT","40DT"]
    
    //widgets
    @IBOutlet weak var MedTV: UITableView!
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return med.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        cell?.layer.backgroundColor = UIColor.clear.cgColor
        cell?.backgroundColor = .clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        let cv = cell?.contentView
        let medImg = cv?.viewWithTag(1) as! UIImageView
        let medname = cv?.viewWithTag(2) as! UILabel
        let cat = cv?.viewWithTag(3) as! UILabel
        let prixmed = cv?.viewWithTag(4) as! UILabel
        
        medImg.image = UIImage(named:medimage[indexPath.row])
        medname.text = med[indexPath.row]
        prixmed.text = prix[indexPath.row]
        cat.text = categ[indexPath.row]
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue3", sender: indexPath)    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="segue3") {
            let indexPath = sender as! IndexPath
            let destination = segue.destination as! Description
            destination.MedNames = med[indexPath.row]
            destination.MedImages = medimage[indexPath.row]    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PanierAction(_ sender: Any) {
        performSegue(withIdentifier: "segue7", sender: sender)
        
    }
    

    
}
