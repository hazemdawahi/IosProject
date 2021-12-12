//
//  blankViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 10/12/2021.
//

import UIKit

class blankViewController: UIViewController {

    override func viewDidLoad() {
   
        super.viewDidLoad()

  segu()

    }
    


    func segu(){
            let token = UserDefaults.standard.string(forKey: "token")!
             print(token)
             if (!(token=="")) {
                performSegue(withIdentifier: "levelsegu", sender:nil )
             
         }
             else
             {
                 performSegue(withIdentifier: "loginsegu", sender:nil )

             
             }
     
    }
}
