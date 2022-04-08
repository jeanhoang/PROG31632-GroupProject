//
//  User.swift
//  grannySmithWorkoutBuddy
//
//  Created by  on 2022-04-06.
//

import UIKit

class User: NSObject {
    
    var id : Int?
    var username : String?
    var goal : String?
    var fitness : String?
    var avatar : String?
    
    func initWithData(theRow i:Int,theUsername n:String, theGoal g:String, theFitness f:String,theAvatar a:String){
        id = i
        username = n
        goal = g
        fitness = f
        avatar = a
        
    }


}
