//
//  TestDViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 5/12/2021.
//

import UIKit
import AVFoundation

class TestDViewController: UIViewController {

    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var useranswer: UITextField!
    @IBOutlet weak var question: UILabel!
    @IBOutlet var progress: UIView!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionR = testDService.shareinstance.question()
        let scoreR = testDService.shareinstance.score()

        question.text  = questionR
       score.text = scoreR
    }
    

    @IBAction func speakerAction(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: question.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }

    func evel()
    {

        let testDM = testDModel(question1: "", answer1: useranswer.text!, question2: "", answer2: "", question3: "", answer3: "")
                                
        let message = testDService.shareinstance.answer(testD: testDM)
    }
    @IBAction func validateAction(_ sender: Any) {
        evel()
        
               viewDidLoad()

     
    }

    
    
}
