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
    
//
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
            
            saveArrayIntoUserDefaults(arrayToSave:q1AnswerArray)
            
        }
    }
    
    func saveArrayIntoUserDefaults(arrayToSave:[[Int:String]]) {
        
        // Encode the array and save it into UserDefaults
        do {
            try defaults.set(JSONEncoder().encode(arrayToSave), forKey: "q1TypeAnswersArray")
            print("Array is saved in defaults without an issue")
        } catch {
            print("There was an error trying to encode the array and adding it to UserDefaults")
            print(error)
        }
        
    }

    mutating func setArrayToUserDefaultsValue(arrayToSet:[[Int:String]]) {
        
        // Check to see if there is data in the UserDefaults and if so
        if let data = defaults.data(forKey: "q1TypeAnswersArray") {
            do {
                q1AnswerArray = try JSONDecoder().decode([[Int: String]].self, from: data)
            } catch {
                print("There was an error trying to decode data from ")
                print(error)
            }
        } else {
            print("There was an issue with decoding and setting new array to value in UserDefaults")
        }
        
    }

}
