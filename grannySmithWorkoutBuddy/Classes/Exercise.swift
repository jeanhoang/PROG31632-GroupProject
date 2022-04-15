//
//  Exercise.swift
//  grannySmithWorkoutBuddy
//
//  Created by Christopher Lewis on 2022-04-14.
//

import UIKit

class Exercise: NSObject {
    
    var id : Int?
    var exerciseName : String?
    var muscleGroup : String?
    var webLink : String?
    
    func initWithData(theRow i : Int, theName n : String, theMuscle m : String, theWeb w : String) {
        id = i
        exerciseName = n
        muscleGroup = m
        webLink = w
    }

}
