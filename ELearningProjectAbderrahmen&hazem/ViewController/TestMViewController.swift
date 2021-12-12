//
//  TestMViewController.swift
//  ELearningProjectAbderrahmen&hazem
//
//  Created by Mac-Mini-2021 on 5/12/2021.
//

import UIKit
import AVFoundation

class TestMViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var useranswer: UITextField!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionR = testMService.shareinstance.question()
        let scoreR = testMService.shareinstance.score()

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

        let testMM = testMModel(question1: "", answer1: useranswer.text!, question2: "", answer2: "", question3: "", answer3: "", question4: "", answer4: "", question5: "", answer5: "", question6: "", answer6: "")
                                
        let message = testMService.shareinstance.answer(testM: testMM)
    }

    @IBAction func validateAction(_ sender: Any) {
        evel()
        
               viewDidLoad()
    }

    
    
}
