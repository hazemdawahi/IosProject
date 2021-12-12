//
//  ProfileViewController.swift
//  
//
//  Created by Mac-Mini-2021 on 21/11/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var nomP: UILabel!
    
    @IBOutlet weak var emailP: UILabel!
    
    @IBOutlet weak var ImageProfile: UIImageView!
    
    @IBOutlet weak var ImageProfilee: UIImageView!
    
  
    var user : userModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        intialiseProfile()
        // Do any additional setup after loading the view.
    
        
        
        /*var path = String("http://localhost:3000/"+(self.clientVM.ClientToken?.image)!).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
         
         path = path.replacingOccurrences(of: "%5C", with: "/", options: NSString.CompareOptions.literal, range: nil)
          let url = URL(string: path)!
          print(url)
        IMVProfileImage.af.setImage(withURL: url) */
    }
    
 

    
    func intialiseProfile() {
        let name = UserDefaults.standard.string(forKey: "name")!
        let email = UserDefaults.standard.string(forKey: "email")!
        let password = UserDefaults.standard.string(forKey: "password")!

        print("initializing profile")

        UserService.shareinstance.getProfile(name: name, completionHandler: {
            isSuccess, user in
            if isSuccess{
                self.nomP.text = name
                self.emailP.text = email
           

            }
        })
           
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func modifierBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "Modifier", sender: nil)

    }
    func testSegue(_ identifier: String!, sender:AnyObject!){
        performSegue(withIdentifier: identifier, sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "Modifier"{
            
            let distination = segue.destination as? UpdateProfileViewController
        }
            
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
