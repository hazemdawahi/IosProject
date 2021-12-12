//
//  LevelsViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 5/12/2021.
//

import UIKit
import SwiftyJSON

class LevelsViewController: UIViewController {
    
    
    @IBOutlet weak var vielabel: UILabel!
    @IBOutlet weak var lvl1B: UIButton!
    
    @IBOutlet weak var ocrbtn: UIButton!
    
    @IBOutlet weak var lvl2B: UIButton!
    
    @IBOutlet weak var lvl3B: UIButton!
    
    @IBOutlet weak var lvl4B: UIButton!
    
    @IBOutlet weak var lvl5B: UIButton!
    
    @IBOutlet weak var lvl6B: UIButton!
    
    @IBOutlet weak var lvl7B: UIButton!
    
    @IBOutlet weak var lvl8B: UIButton!
    
    var   Access =    UserService.shareinstance.access()
    var niveau =  UserService.shareinstance.getniveau()
    var whereU = UserService.shareinstance.getwhere()
    let pass = lvl1Service.shareinstance.pass()
    let vie = UserService.shareinstance.getvie()
    let viepass = UserService.shareinstance.vie0()
    @IBOutlet weak var heartscore: UILabel!
    override func viewDidLoad() {
        
        
        self.viewWillAppear(true)
        
        
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewLoadSetup()
        
        super.viewWillAppear(animated)
        
    }
    func viewLoadSetup(){
        vielabel.text = vie;
        //print("where")
        print (whereU)
        
        
        if (viepass.contains("0"))
        {
            let alertController = UIAlertController(title: "Lifes", message: "You dont have enougth lifes", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
        
        if ((niveau.contains("debutant"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2g"), for: [])
            lvl3B.setImage(UIImage(named: "3g"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
        }
        if ((niveau.contains("expert"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
        }
        if ((whereU.contains("1"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            
            lvl2B.setImage(UIImage(named: "2g"), for: [])
            lvl3B.setImage(UIImage(named: "3g"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl2B.isEnabled = false
            
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
        }
        if ((whereU.contains("1"))&&(viepass.contains("0"))) {
            
            lvl1B.setImage(UIImage(named: "1"), for: [])
            
            lvl2B.setImage(UIImage(named: "2g"), for: [])
            lvl3B.setImage(UIImage(named: "3g"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        
        if ((whereU.contains("2"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3g"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl2B.isEnabled = true
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
        }
        if ((whereU.contains("2"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3g"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("3"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
        }
        if ((whereU.contains("3"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4g"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("4"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("4"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5g"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("5"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
        }
        if ((whereU.contains("5"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6g"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("6"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
        }
        if ((whereU.contains("6"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6"), for: [])
            lvl7B.setImage(UIImage(named: "7g"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("7"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6"), for: [])
            lvl7B.setImage(UIImage(named: "7"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            
            lvl8B.isEnabled = false
            
        }
        if ((whereU.contains("7"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6"), for: [])
            lvl7B.setImage(UIImage(named: "7"), for: [])
            lvl8B.setImage(UIImage(named: "8g"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        if ((whereU.contains("8"))&&(viepass.contains("1"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6"), for: [])
            lvl7B.setImage(UIImage(named: "7"), for: [])
            lvl8B.setImage(UIImage(named: "8"), for: [])
            
        }
        if ((whereU.contains("8"))&&(viepass.contains("0"))) {
            lvl1B.setImage(UIImage(named: "1"), for: [])
            lvl2B.setImage(UIImage(named: "2"), for: [])
            lvl3B.setImage(UIImage(named: "3"), for: [])
            lvl4B.setImage(UIImage(named: "4"), for: [])
            lvl5B.setImage(UIImage(named: "5"), for: [])
            lvl6B.setImage(UIImage(named: "6"), for: [])
            lvl7B.setImage(UIImage(named: "7"), for: [])
            lvl8B.setImage(UIImage(named: "8"), for: [])
            lvl1B.isEnabled = false
            lvl2B.isEnabled = false
            lvl3B.isEnabled = false
            lvl4B.isEnabled = false
            lvl5B.isEnabled = false
            lvl6B.isEnabled = false
            lvl7B.isEnabled = false
            lvl8B.isEnabled = false
            
            
        }
        
    }
    @IBAction func SignoutAction(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "userID")
        UserDefaults.standard.set("", forKey: "token")
        UserDefaults.standard.set(""  , forKey: "name")
        UserDefaults.standard.set("", forKey: "email")
        UserDefaults.standard.set("", forKey: "role")
        UserDefaults.standard.set("", forKey: "password")
        UserDefaults.standard.set("", forKey: "date")
        UserDefaults.standard.set("", forKey: "niveau")
        UserDefaults.standard.set("", forKey: "langue")
        UserService.shareinstance.logoutsignout()
        
        
    }
    @IBAction func lvl1Action(_ sender: Any) {
        /*
         let refreshAlert = UIAlertController(title: "Aquire A Test", message: "Start of with a test or not .", preferredStyle: UIAlertController.Style.alert)
         
         refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
         self.performSegue(withIdentifier: "segutestD", sender: nil)
         }))
         
         refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
         self.performSegue(withIdentifier: "segul1", sender: nil)
         }))
         
         present(refreshAlert, animated: true, completion: nil)
         
         */
        
        
    }
    @IBAction func lvl2Action(_ sender: Any) {
        
        
        
    }
    
    @IBAction func lvl3Action(_ sender: Any) {
        
    }
    
    @IBAction func lvl4Action(_ sender: Any) {
        if Access.contains("false") {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Payment Notification!"
            content.body = "You need to pay in order to get full access"
            
            let date = Date().addingTimeInterval(10)
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            let uuidString = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            center.add(request) { (error) in
                // Check the error parameter and handle any errors
            }
            
            self.performSegue(withIdentifier: "segup", sender: nil)
            
        }
        
        if Access.contains("true") {
            self.performSegue(withIdentifier: "segul4", sender: nil)
            
        }
    }
    
    @IBAction func lvl5Action(_ sender: Any) {
        if Access.contains("false") {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Payment Notification!"
            content.body = "You need to pay in order to get full access"
            
            let date = Date().addingTimeInterval(10)
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            let uuidString = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            center.add(request) { (error) in
                // Check the error parameter and handle any errors
            }
            
            self.performSegue(withIdentifier: "segup", sender: nil)
            
        }
        
        if Access.contains("true") {
            self.performSegue(withIdentifier: "segul5", sender: nil)
            
        }
    }
    
    
    @IBAction func lvl6Action(_ sender: Any) {
        if Access.contains("false") {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Payment Notification!"
            content.body = "You need to pay in order to get full access"
            
            let date = Date().addingTimeInterval(10)
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            let uuidString = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            center.add(request) { (error) in
                // Check the error parameter and handle any errors
            }
            
            self.performSegue(withIdentifier: "segup", sender: nil)
            
        }
        
        if Access.contains("true") {
            self.performSegue(withIdentifier: "segul6", sender: nil)
            
        }
    }
    
    @IBAction func lvl7Action(_ sender: Any) {
        if Access.contains("false") {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Payment Notification!"
            content.body = "You need to pay in order to get full access"
            
            let date = Date().addingTimeInterval(10)
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            let uuidString = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            center.add(request) { (error) in
                // Check the error parameter and handle any errors
            }
            
            self.performSegue(withIdentifier: "segup", sender: nil)
            
        }
        
        if Access.contains("true") {
            self.performSegue(withIdentifier: "segul7", sender: nil)
            
        }
    }
    
    
    @IBAction func lvl8Action(_ sender: Any) {
        if Access.contains("false") {
            let center = UNUserNotificationCenter.current()
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Payment Notification!"
            content.body = "You need to pay in order to get full access"
            
            let date = Date().addingTimeInterval(10)
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            
            let uuidString = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            center.add(request) { (error) in
                // Check the error parameter and handle any errors
            }
            
            self.performSegue(withIdentifier: "segup", sender: nil)
            
        }
        
        if Access.contains("true") {
            self.performSegue(withIdentifier: "segul8", sender: nil)
            
        }
    }
    
}
