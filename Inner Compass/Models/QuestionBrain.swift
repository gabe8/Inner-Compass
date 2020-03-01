//
//  QuestionBrain.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 2/4/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import Foundation

struct QuestionBrain {
    
    var questionNumber = 0
    
    let type1Questions = [
            QuestionType1(
                question: "1. What do you spend your time on primarily?",
                description: "What are 2-3 things do you spend your time on the most, every day? You will make time for things that are really important to you and you will run out of time for things that are not."
            ),
            QuestionType1(
                 question: "2. How do you spend your energy most and what energises you most?",
                 description: "What do you find energy for most? You will always have energy for things that are truly highest on your values list and will run out of energy for things that aren’t important. What three actions energise you the most or make you feel most vital?"
             ),

            QuestionType1(
                 question: "3. How do you spend your money?",
                 description: "What are the three consistent things you spend your money on most? You will feel reluctant to spend money on things you perceive to be unimportant. If something means a lot to you, you will certainly work out a way to pay for it."
             ),
            QuestionType1(
                 question: "4. What do you spend your time on primarily?",
                 description: "Where are you ordered and organised most and what are the three things that you are most organised in? You have at least a few areas of order and areas of disorder in your life. The things that are important to you, you will spend time organising. What are they? Don’t lie to yourself!."
             ),
            QuestionType1(
                       question: "5. Where are you most organised and ordered in your life?",
                       description: "Consider a meaningful moment in your life or a peak experience that stands out. What was happening to you? What was going on? Write down 2-3 values were you honoring at this time."
                )
        
    ]
    
    //Set a method where by the main question for a given question can be retrieved
    func getQuestionMain() -> String {
        return type1Questions[questionNumber].question
    }
    
    //Set a method where by the description for a given question can be retrieved
    func getQuestionDescription() -> String {
        return type1Questions[questionNumber].description
    }
    func getQuestionInstructions() -> String {
        let testString = "Hello there!!!"
        return testString
        
    }
    
    mutating func nextQuestion() {
        
        questionNumber += 1
        
    }
    
    func saveAnswer() {
        
        //Take the values from the UITextfields and save it into a record in UserDefaults
        let defaults = UserDefaults.standard
        
        
    }
    
}
