//
//  EditProfileViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by HaominChen on 2022-04-06.
//

import UIKit

class EditProfileViewController: UIViewController, UITextFieldDelegate {
    //access to appdelegate
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var tfUsername : UITextField!
    @IBOutlet var fitnessSlider : UISlider!
    
    let step : Float = 10
    var avatar : String!
    var goal : String!
    var fitness : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //keyboard will disappear when user finish data input
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    //save avatar when user click a avatar
    @IBAction func saveAvatar(sender: UIButton){
        
           if sender.tag == 0{
               avatar = mainDelegate.avatarOptions[0]
           }
           if sender.tag == 1{
               avatar = mainDelegate.avatarOptions[1]
           }
           if sender.tag == 2{
               avatar = mainDelegate.avatarOptions[2]
           }
    }

    //save user goal when user click a goal
    @IBAction func saveGoal(sender:UIButton){
      
        if sender.tag == 3{
            goal = "Gain Muscle"
        }
        if sender.tag == 4{
            goal = "Weight Loss"
        }
    }
    
    //set slider only move to three positions
    @IBAction func sliderValueDidChange(sender:UISlider){
        
        let roundedStepValue = round(sender.value / step) * step
        sender.value = roundedStepValue
        
    }
   
    //save fintness level when user select a level
    @IBAction func saveFitness(sender:UISlider){
        
        if sender.value == 0{
            fitness = "Beginner"
        }
        if sender.value == 10{
            fitness = "Intermediate"
        }
        if sender.value == 20{
            fitness = "Advanced"
        }
    }
    
    //when user finish editing the profile, check the data input
    @IBAction func editUser(sender: UIButton){
        
        if sender.tag == 5{
           
            let person : User = User.init()
            person.initWithData(theRow: 0, theUsername: tfUsername.text!, theGoal: goal!, theFitness: fitness!, theAvatar: avatar!)
            //access to the appdelegate to use editUserIntoDatabase method
            let returnCode : Bool = mainDelegate.editUserIntoDatabase(person: person)
            //return successful message if user has valid input
            var returnMSG : String = "Hello "+tfUsername.text! + ","+"\n Profile has been updated!"
            //return unsuccessful message if user has invalid input
            if returnCode == false{
                        returnMSG = "User updates failed"
                    }
                    //alert dialog
                    let alert=UIAlertController(title:"Updated",message:returnMSG,preferredStyle: .alert)
                    let okAction=UIAlertAction(title:"OK",style:.default)
                    alert.addAction(okAction)
                    present(alert,animated: true)    }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


