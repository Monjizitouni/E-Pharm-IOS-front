//
//  Login.swift
//  E-Pharm
//
//  Created by Mac-Mini_2021 on 11/04/2022.
//

import UIKit
import Alamofire

class Login: UIViewController {
    
    let userViewModel = UserViewModel()
    let spinner = SpinnerViewController()
    
    var email: String?
    var user: User?
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var motDePasseTextField: UITextField!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = email
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    //Methode
    func startSpinner() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    func stopSpinner() {
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
    func reEnvoyerEmail(email: String?) {
        userViewModel.reEnvoyerConfirmationEmail(email: email!, completed: { (success) in
            if success {
                self.present(Alert.makeAlert(titre: "Success", message: "Confirmation email has been sent to " + email!), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Could not send the confirmation email"), animated: true)
            }
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
//IBaction
    @IBAction func loginaction(_ sender: Any) {
        
        if(emailTextField.text!.isEmpty || motDePasseTextField.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Warning", message: "Please type your credentials"), animated: true)
            return
        }
        
        startSpinner()
        
        userViewModel.connexion(email: emailTextField.text!, password: motDePasseTextField.text!,completed: { (success, reponse) in
            
            self.stopSpinner()
            
            if success {
                let utilisateur = reponse as! User
                
                if utilisateur.isVerified! {
                    self.performSegue(withIdentifier: "segue2", sender: nil)
                } else {
                    let action = UIAlertAction(title: "Renvoyer", style: .default) { UIAlertAction in
                        self.reEnvoyerEmail(email: utilisateur.email)
                    }
                    self.present(Alert.makeActionAlert(titre: "Notice", message: "This email is not confirmed, would you like to resend the confirmation email to " + utilisateur.email! + " ?", action: action),animated: true)
                    self.reEnvoyerEmail(email: utilisateur.email)
                }
            } else {
                self.present(Alert.makeAlert(titre: "Warning", message: "Email or password incorrect"), animated: true)
            }
        })
    
    
    
     
        
}

}
