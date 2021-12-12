//
//  EvaluationViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 29/11/2021.
//

import UIKit
import AVFoundation

class EvaluationViewController: UIViewController {
    
    
    @IBOutlet weak var Speaker: UIButton!
    
    @IBOutlet weak var answeruser: UITextField!
    @IBOutlet weak var QustionField: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var valider: UIButton!
    @IBOutlet weak var iamgeQuestin: UIImageView!

    @IBOutlet weak var score: UILabel!
    
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        let questionR = lvl1Service.shareinstance.question()
        let scoreR = lvl1Service.shareinstance.score()
        let pass = lvl1Service.shareinstance.pass()

        let wherel = UserService.shareinstance.getwhere()
        let prog = UserService.shareinstance.progress()
        QustionField.text  = questionR
       score.text = scoreR

        

        if (questionR.contains("congratulations")) {
            
            valider.alpha = 2;5;
            valider.isEnabled = false;
            score.isHidden = true
            
            if( pass.contains("yes"))
            {
    
                if (!(prog.contains("2")))
                {
                let alertController = UIAlertController(title: "Congratulation", message: "You sucessed", preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            
                            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                            UserService.shareinstance.changepro2()
                            UserService.shareinstance.where2()
                            UserService.shareinstance.changevieminus()
                            self.performSegue(withIdentifier: "exit1", sender: nil)
                    
                
            }
                alertController.addAction(OKAction)

                self.present(alertController, animated: true, completion:nil)
           
            }
            }
            
            else{
                if (!(prog.contains("2")))
                {
                let alertController = UIAlertController(title: "Failed", message: "You Failed", preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            UserService.shareinstance.changevieminus()
                            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                            self.performSegue(withIdentifier: "exit1", sender: nil)
                          
                         

                            
                        }
                alertController.addAction(OKAction)

                self.present(alertController, animated: true, completion:nil)

   
                }
            }
        }
        

    }
    
    @IBAction func SpeakerAction(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: QustionField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    func evel()
    {
        
        let lvl1M = lvl1Model(question1: "", answer1: answeruser.text!, question2: "", answer2: "", question3: "", answer3: "", question4: "", answer4: "", question5: "", answer5: "", question6: "", answer6: "", question7: "", answer7: "", question8: "", answer8: "", question9: "", answer9: "", question10: "", answer10: "")
                                
        let message = lvl1Service.shareinstance.answer(Lvl1: lvl1M)
        }
    
    
    
    
    @IBAction func validateAction(_ sender: Any) {
        if( self.answeruser.text!.isEmpty ){
            self.present(Alert.makeAlert(titre: "Missing info !", message: "Please make sure to fill the answerfield  and try again"), animated: true)
            return
        }
        else{
            evel()
         
               viewDidLoad()
               
        }

    }
}
