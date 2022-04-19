/*
 Author: Christopher Lewis
 This class is used for creating exercise objects based on the database entries. Each exercise has an auto generated ID, an exercise name, an associated muscle group, and a web link to a website with more information about the exercise
 */

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
