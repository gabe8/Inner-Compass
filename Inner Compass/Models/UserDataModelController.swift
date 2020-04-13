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
    
    
    mutating func setupAnswerArray() {
        // Check to see if UserDefaults is empty and if it is, create a new array to store questions answers
        let defaults = UserDefaults.standard
        var arrayToSave = [[Int:String]]()
        if defaults.object(forKey: "q1TypeAnswersArray") == nil {
            // Create an array and loop through it to create empty dictionaries as placeholders, used to store answers
            for _ in 1...10 {
                arrayToSave.append([Int:String]())
            }
            print("The array has been initialized and here are it's values:")
            dump(arrayToSave)
            do {
                try defaults.set(JSONEncoder().encode(arrayToSave), forKey: "q1TypeAnswersArray")
            } catch {
                print(error)
            }
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
            let defaults = UserDefaults.standard
            var arrayToSave = storedUserData()
            arrayToSave[questionNumber][answerNumber] = answerString
            print("Here is the array after the new textfield string was saved")
            dump(arrayToSave)
            try defaults.set(JSONEncoder().encode(arrayToSave), forKey: "q1TypeAnswersArray")
        } catch {
            print("There was an error trying to encode the array and adding it to UserDefaults")
            print(error)
        }
    }


    mutating func existingAnswerFromUserDefaults(questionNumber: Int, answerNumber: Int) -> String? {    
        var arrayToSave = [[Int:String]]()
        arrayToSave = storedUserData()
        return arrayToSave[questionNumber][answerNumber] ?? nil
    }
    
    // TG: Call this from both restoreArray... and saveAnswer()
    // If there are ever performance issues, an instance variable for redundantly storing the contents of userdefaults can
    // be reinstated, and that value can be returned here rather than a JSONDecoded data structure
    
    func storedUserData() -> [[Int:String]] {
        // TG: Dig into user defaults with JSONDecoder and return the whole thing
        let defaults = UserDefaults.standard
        var arrayToSave = [[Int:String]]()
        if let data = defaults.data(forKey: "q1TypeAnswersArray") {
            do {
                arrayToSave = try JSONDecoder().decode([[Int: String]].self, from: data)
            } catch {
                print(error)
            }
        } else {
            print("Issue with decoding and setting new array")
        }
        //return  [[Int:String]]()
        return arrayToSave
    }
}
