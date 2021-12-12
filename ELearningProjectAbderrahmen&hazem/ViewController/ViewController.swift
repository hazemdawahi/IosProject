//
//  ViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac2021 on 6/11/2021.
//

import UIKit
import GoogleSignIn
import Alamofire
import CoreData
import Parse

class ViewController: UIViewController, GIDSignInUIDelegate{

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var mdp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.shareinstance.viedate()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        let gSignIn = GIDSignInButton(frame: CGRect(x: 11, y: 820, width: 133, height: 42))
        view.addSubview(gSignIn)
    
        let signOut = UIButton (frame: CGRect(x: 281, y: 820, width: 133, height: 42))
        signOut.backgroundColor = UIColor.red
        signOut.setTitle("Sign out", for:  .normal)
        signOut.addTarget(self, action: #selector(self.signOut(sender:)), for: .touchUpInside)
        self.view.addSubview(signOut)
       
    }
        
 
    
    @objc func signOut(sender: UIButton)
        {
            print ("signOut")
            GIDSignIn.sharedInstance().signOut()
        }
        
    //post
 
    
    @IBAction func loginBtn(_ sender: Any) {

        guard let username = self.email.text else{return}
        guard let password = self.mdp.text else{return}
        //let admin = adminModel(email: email, motdepasse: motdepasse)
        if(self.email.text!.isEmpty || self.mdp.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Avertissement", message: "Vous devez taper vos identifiants"), animated: true)
            return
        }
        
        UserService.shareinstance.login(email: username, motdepass: password){
            (isSuccess) in
            if isSuccess{
                self.performSegue(withIdentifier: "levels", sender: nil)
                //self.present(Alert.makeAlert(titre: "Alert", message: "User register successfully"), animated: true)
                self.present(Alert.makeAlert(titre: "Alert", message: " successfully"), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Alert", message: "Please try again successfully"), animated: true)
            }
        }


    }
    
    func testSegue(_ identifier: String!, sender:AnyObject!){
        performSegue(withIdentifier: identifier, sender: sender)
    }
    func propmt(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
    }
    

        
}
