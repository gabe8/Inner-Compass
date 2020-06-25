//
//  ContentModelController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 2/4/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import Foundation

struct ContentModelController {
    var questionNumber = 0
    
    // These questions were written to be simple and interesting to increase user engagement.  They are more positive towards
    // top and potentially negative ones couched in the middle.  The
    let type1Questions = [
        QuestionType1(
            question: "1. What is most important to you?\n",
            description: "Write down the first three things that come to your mind. Another way to think about this: what have been the most important things in your life? Beyond your basic human needs, what must you have in your life to experience fulfillment?\n"
        ),
        QuestionType1(
            question: "2. When do you feel the most alive, satisfied or energized in your life? Why?\n",
            description: " What gives you a feeling of fullfillment and enjoyment? When do you feel the most present in your own life? What values in yourself, does this reflect? The things that give you energy, purpose and fulfillment, can be good indicators about what’s most important to you.\n"
            
        ),
        QuestionType1(
            question: "3. What do you spend your time on primarily? What is important to you about these activities?\n",
            description: "What are things you spend your time on the most, every day?  What values in yourself do these activities reflect? You will usually make time for things that are really important to you.\n"
        ),
        QuestionType1(
            question: "4. How do you spend your money? Why?\n",
            description: "After your essential expenses, what do you spend your money on the most, or more consistently, that's important to you? Now identify what values you hold, that drive such purchases? You will feel reluctant to spend money on things you perceive to be unimportant, and you will find a way to pay for things that are important or meaningful to you.\n"
        ),
        QuestionType1(
            question: "5. Who in your life, or history, inspired you the most?  What does this say about the underlying values you hold?\n",
            description: "What is it exactly that inspires you about this person/people the most?  What principles, qualities or accomplishments do you most admire and value in those that inspire you the most?  What inspires us about others, is something important to us that we usually seek to model or embody.\n"
        ),
        QuestionType1(
            question: "6. Consider a time when you got angry or upset - now flip this - what positive value was being violated or wronged?\n",
            description: "Consider a time you got angry or upset about someone or something.  What were you thinking and feeling in that moment?  Now think to what value was being violated or challenged - what was it?  We often experience feelings of anger around things that violate, go against or suppress our values.\n"
        ),
        QuestionType1(
            question: "7. What / whom do you prioritize, or try to prioritize, the most in your life?\n",
            description: "What values underlie these priorities?  We usually prioritize that which is important to us, and shape our lives around them.\n"
        ),
        QuestionType1(
            question: "8. What are you most lacking or missing in your life?\n",
            description: "What would you like to have, experience, feel or be more of, in your life?  What we lack - our voids - often show what is important to us and we will seek to fill them.\n"
        ),
        QuestionType1(
            question: "9. How would like to most be remembered?\n",
            description: "How would you like people to remember you, and what would you like them to say about you at your funeral? What would you like said about you most, on your obituary? How you want others to remember you and think of you years from now, can help you identify what values you need to live by now a this time in your life, to make that happen.\n"
        ),
        QuestionType1(
            question: "10. What do you dream, visualize or fantasize about, that you would like to see in your life?\n",
            description: "What do you spend time visualizing or daydreaming about, that you desire in your life?  What we spend time fantasizing or daydreaming about are often things that are important to us.\n"
        ) 
    ]
    // two questions missing from here that are important - peak experiences and what topics are you interested in
    
    
    //Set a method where by the main question for a given question can be retrieved
    func getQuestionMain() -> String {
        return type1Questions[questionNumber].question
    }
    
    //Set a method where by the description for a given question can be retrieved
    func getQuestionDescription() -> String {
        return type1Questions[questionNumber].description
    }
    
    func getQuestionInstructions() -> String {
        let testString = "Write down 1-3 values in the fields below that best answer this question.  Condense and summarize each so they are a single word or phrase:"
        return testString
    }
    
//    func saveAnswer() {
//        
//        //Take the values from the UITextfields and save it into a record in UserDefaults
//        //let defaults = UserDefaults.standard
//
//    }
}
