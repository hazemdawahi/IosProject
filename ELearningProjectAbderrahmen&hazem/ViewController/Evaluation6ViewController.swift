//
//  Evaluation6ViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 5/12/2021.
//

import UIKit
import AVFoundation

class Evaluation6ViewController: UIViewController {

    
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var useranswer: UITextField!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        let questionR = lvl6Service.shareinstance.question()
        let scoreR = lvl6Service.shareinstance.score()
        let pass = lvl6Service.shareinstance.pass()

        let wherel = UserService.shareinstance.getwhere()
        let prog = UserService.shareinstance.progress()
        question.text  = questionR
       score.text = scoreR

        

        if (questionR.contains("congratulations")) {
            
            valider.alpha = 2;5;
            valider.isEnabled = false;
            score.isHidden = true
            
            if( pass.contains("yes"))
            {
    
                if (!(prog.contains("7")))
                {
                let alertController = UIAlertController(title: "Congratulation", message: "You sucessed", preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            
                            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                            UserService.shareinstance.changepro7()
                            UserService.shareinstance.where7()
                            UserService.shareinstance.changevieminus()
                            self.performSegue(withIdentifier: "exit6", sender: nil)
                    
                
            }
                alertController.addAction(OKAction)

                self.present(alertController, animated: true, completion:nil)
           
            }
            }
            
            else{
                if (!(prog.contains("7")))
                {
                let alertController = UIAlertController(title: "Failed", message: "You Failed", preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            UserService.shareinstance.changevieminus()
                            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                            self.performSegue(withIdentifier: "exit6", sender: nil)
                          
                         

                            
                        }
                alertController.addAction(OKAction)

                self.present(alertController, animated: true, completion:nil)

   
                }
            }
        }
        

    }

   
    @IBAction func speakerAction(_ sender: Any) {
    
    let utterance = AVSpeechUtterance(string: question.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
    synth.speak(utterance)
    
    }

    func evel()
    {

        let lvl6M = lvl6Model(question1: "", answer1: useranswer.text!, question2: "", answer2: "", question3: "", answer3: "", question4: "", answer4: "", question5: "", answer5: "", question6: "", answer6: "", question7: "", answer7: "", question8: "", answer8: "", question9: "", answer9: "", question10: "", answer10: "")
                                
        let message = lvl6Service.shareinstance.answer(Lvl6: lvl6M)
    }
    

    @IBAction func validateAction(_ sender: Any) {
        evel()
                           viewDidLoad()
    }


  

    

    
   
}
