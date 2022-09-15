//
//  Inscription.swift
//  E-Pharm
//
//  Created by Mac-Mini_2021 on 11/04/2022.
//

import UIKit

class Inscription: UIViewController {
    
    var username: String?
    var email: String?
    var phone: String?
    var currentUser: Bool?
    var userViewModel = UserViewModel()
    var user = User()
    
    // WIDGET
    
    @IBOutlet weak var pseudoTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func goToLogin(email: String?) {
        self.performSegue(withIdentifier: "login", sender: email)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let destination = segue.destination as! Login
            destination.user = user
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    
    func makeAlert(titre: String?, message: String?) {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func inscription(_ sender: Any) {
        if (pseudoTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your username")
            return
        }
        
        if (emailTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your email")
            return
        }else if (emailTextField.text?.contains("@") == false){
            makeAlert(titre: "Warning", message: "Please type your email correctly")
            return
        }
        
        if (phoneTextField.text == "") {
            makeAlert(titre: "Warning", message: "Please type your phone")
            return
        }
        
        
        user.username = pseudoTextField.text
        user.email = emailTextField.text
        user.phone = phoneTextField.text
        
        let child = SpinnerViewController()
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        userViewModel.inscription(user: user, completed: { (success) in
            // STOP Spinner
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            
            if success {
                
                let alert = UIAlertController(title: "Success", message: "Your account has been created.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
                    self.goToLogin(email: self.user.email)
                }
                alert.addAction(action)
                self.present(alert, animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Account may already exist."), animated: true)
            }
            
            // STOP Spinner
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        })
        
        
    }
    
    
}
