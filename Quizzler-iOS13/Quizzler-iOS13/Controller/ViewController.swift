//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var questionView: UILabel!
    
    @IBOutlet weak var scoreTextView: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBarView.progress=0.0
        questionView.text=quizBrain.getQuestionText()
        scoreTextView.text = "Score: \(quizBrain.getScore())"
        
    }

    @IBAction func onAnswerButtonClicked(_ sender: UIButton) {
          let isCorrect =  quizBrain.checkAnswer(answer: sender.currentTitle!)
        if isCorrect{
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { Timer in
            self.updateProgress(sender)
        }
       
        
        
    }
    func updateProgress(_ sender: UIButton){
        quizBrain.nextQuestion()
        questionView.text = quizBrain.getQuestionText()
    
        sender.backgroundColor = UIColor.clear
        progressBarView.progress = quizBrain.getProgress()
        scoreTextView.text = "Score : \(quizBrain.getScore())"
        
    }
 
   
}

