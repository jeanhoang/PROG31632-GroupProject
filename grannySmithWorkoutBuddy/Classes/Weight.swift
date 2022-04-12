//
//  Weight.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-04-10.
//

import UIKit

class Weight: NSObject {
    
    var id : Int?
    var weight : Int?
    var date : String?
    
    func initWithData(theRow i : Int, theWeight w : Int, theDate d : String) {
        id = i
        weight = w
        date = d
    }

}
