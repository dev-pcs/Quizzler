//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Priyank Shah on 7/1/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {      //no need to initialize since all the data is present
    let quiz = [        //constant quiz, will never be changed
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    
    var questionNumber = 0                                          //QuizBrain------> Question number property
    var score = 0                                                   //QuizBrain------> score tracking property
    
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {       //QuizBrain------> answer checking method
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        }else {
            return false
        }
    }
    
    
    func getAnswers() -> [String] {                                 //QuizBrain------> Getting answers method
        return quiz[questionNumber].answers
    }
    
    
    func getScore() -> Int {                                        //QuizBrain------> Getting score method
        return score
    }
    
    
    func getQuestionText() -> String {                              //QuizBrain------> getting question method
        return quiz[questionNumber].text
    }
    
    
    func getProgress() -> Float {                                   //QuizBrain------> getting progress method
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    
    mutating func nextQuestion() {                                  //QuizBrain------> getting next question method
        if questionNumber + 1  < quiz.count {
            questionNumber += 1
        }else {
            questionNumber = 0
            score = 0
        }
        
        
    }
}
