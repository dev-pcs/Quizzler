//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit                                            //needed for userInterface

class ViewController: UIViewController {                //controls UIView
    
    @IBOutlet weak var scoreLabel: UILabel!             //display and change score
    @IBOutlet weak var question_label: UILabel!         //display and change question
    @IBOutlet weak var progressBar: UIProgressView!     //display and change progress bar
    @IBOutlet weak var optionThree: UIButton!           //
    @IBOutlet weak var optionTwo: UIButton!             //3 displays for choices
    @IBOutlet weak var optionOne: UIButton!             //
    
    var quizBrain = QuizBrain()                         // ********************  new object from struct
    
    override func viewDidLoad() {                       //What happens when view is loaded
        super.viewDidLoad()
        updateUI()                                      //update UI
    }
    
    
    
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {        //make 3 buttons for 3 choices
        let userAnswer = sender.currentTitle!                       //save the title from button pressed to @userAnswer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)      //******************** check answer, bool type
        
        if userGotItRight {                                         //if right = green, If wrong = red
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()                                    //******************** next question method
        
        //only going to activate after the button is presses, repeats false, selector(function we want)
       Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    
    
    
    
    @objc func updateUI() {                                     //Timer relies on objective (c) so make the func objc
        question_label.text = quizBrain.getQuestionText()       //******************** update the ui with next question
        
        let answerChoices = quizBrain.getAnswers()              //******************** display choices
        optionOne.setTitle(answerChoices[0], for: .normal)
        optionTwo.setTitle(answerChoices[1], for: .normal)
        optionThree.setTitle(answerChoices[2], for: .normal)
        
        optionThree.backgroundColor = UIColor.clear//back to basic
        optionTwo.backgroundColor = UIColor.clear
        optionOne.backgroundColor = UIColor.clear
        
        scoreLabel.text = "score:\(quizBrain.getScore())"       //******************** display and update score
        progressBar.progress = quizBrain.getProgress()          //******************** display and change progress
    }
}

