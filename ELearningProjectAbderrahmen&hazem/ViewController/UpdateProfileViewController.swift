//
//  UpdateProfileViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Apple Esprit on 4/12/2021.
//

import UIKit

class UpdateProfileViewController: UIViewController {

    
    @IBOutlet weak var nomUser: UITextField!
    
    @IBOutlet weak var EmailUser: UITextField!
    
    @IBOutlet weak var mdpUser: UITextField!
    
    @IBOutlet weak var ConfirmMdp: UITextField!
    
    
    var user : userModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialiseProfile()
        // Do any additional setup after loading the view.
    }
    
    
    let name = UserDefaults.standard.string(forKey: "name")!
    let password = UserDefaults.standard.string(forKey: "password")!

    let email = UserDefaults.standard.string(forKey: "email")!
    let userid = UserDefaults.standard.string(forKey: "userID")!
  
    func intialiseProfile() {
        print("initializing profile")

        print("fff")
                self.nomUser.text = name
                self.EmailUser.text = email
                self.mdpUser.text = password
        self.ConfirmMdp.text = password
       
    }
    @IBAction func updateBtn(_ sender: Any) {
        let name2 = self.nomUser.text!
         let email2 = self.EmailUser.text!
         let password2 = self.mdpUser.text!

      
        UserService.shareinstance.updateProfile(userId:userid,name: name2, email: email2, password: password2, completionHandler:  {
            (isSuccess) in
            if isSuccess{
                self.present(Alert.makeAlert(titre: "Alert", message: "User updated successfully"), animated: true)
            } else {
                self.present(Alert.makeAlert(titre: "Alert", message: "Please try again "), animated: true)
            }
        })
    }


}
