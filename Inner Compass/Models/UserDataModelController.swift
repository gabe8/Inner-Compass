//
//  UserDataModelController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 4/1/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import Foundation

// Used to setup data model, store question answers and location in survey
struct UserDataModelController {
    var defaults = UserDefaults.standard
    var q1AnswerArray = [[Int:String]]()
    
//    func setupDataModel () -> {
// Setup array if first time loading
// check userDefaults to set question count
// check Userdefaults to set the array of answers
//
//
//    }
    
    mutating func setupAnswerArray() {
        // Check to see if UserDefaults is empty and if it is, create a new array to store questions answers
     
        if defaults.object(forKey: "q1AnswerArray") == nil {
            // Create an array and loop through it to create empty dictionaries as placeholders, used to store answers
            for _ in 1...10 {
                q1AnswerArray.append([Int:String]())
            }
            
            // saveArrayIntoUserDefaults(arrayToSave:q1AnswerArray)
        }
    }
    
    func saveAnswer(_ answerString: String,
                    forQuestionNumber questionNumber: Int,
                    answerNumber: Int) {
        // TG:
        // I would advise pulling the whole enchilada out of userdefaults and into new variable arrayToSave. right here on
        // the fly, rather than relying on the cache q1AnswerArray.
        // So basically something like let arrayToSave = try JSONDecoder().decode([[Int: String]].self, from: data)
        
        // Encode the array and save it into UserDefaults
        do {
            let arrayToSave = [[Int:String]]() // TG: Temporary- just to keep the compiler happy.
            try defaults.set(JSONEncoder().encode(arrayToSave), forKey: "q1TypeAnswersArray")
            print("Array is saved in defaults without an issue")
        } catch {
            print("There was an error trying to encode the array and adding it to UserDefaults")
            print(error)
        }
    }

    mutating func existingAnswerFromUserDefaults(questionNumber: Int, answerNumber: Int) -> String? {
        if let data = defaults.data(forKey: "q1TypeAnswersArray") {
            do {
                // TG: this might be better done with a temporary variable if there is no other need for it elsewhere in this struct- doensnt' nec. have to be a property of the struct.
                // TG: Replace the following with a call to storedUserData()
                q1AnswerArray = try JSONDecoder().decode([[Int: String]].self, from: data)
            } catch {
                print("There was an error trying to decode data from ")
                print(error)
            }
        } else {
            print("There was an issue with decoding and setting new array to value in UserDefaults")
        }
    
        return q1AnswerArray[questionNumber][answerNumber] ?? nil
    }
    
    // TG: Call this from both restoreArray... and saveAnswer()
    // If there are ever performance issues, an instance variable for redundantly storing the contents of userdefaults can
    // be reinstated, and that value can be returned here rather than a JSONDecoded data structure
    func storedUserData() -> [[Int:String]] {
        // TG: Dig into user defaults with JSONDecoder and return the whole thing
        return  [[Int:String]]()
    }
}
