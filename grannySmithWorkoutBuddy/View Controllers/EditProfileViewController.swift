//
//  EditProfileViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by  on 2022-04-06.
//

import UIKit

class EditProfileViewController: UIViewController, UITextFieldDelegate {
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
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

    @IBAction func saveGoal(sender:UIButton){
      
        if sender.tag == 3{
            goal = "Gain Muscle"
        }
        if sender.tag == 4{
            goal = "Weight Loss"
            
        }
    }
    
    @IBAction func sliderValueDidChange(sender:UISlider){
        
        let roundedStepValue = round(sender.value / step) * step
        sender.value = roundedStepValue
        
    }
    
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
    
    @IBAction func editUser(sender: UIButton){
        
        if sender.tag == 5{
           
            let person : User = User.init()
            person.initWithData(theRow: 0, theUsername: tfUsername.text!, theGoal: goal!, theFitness: fitness!, theAvatar: avatar!)
            let returnCode : Bool = mainDelegate.editUserIntoDatabase(person: person)
            
            var returnMSG : String = "Hello "+tfUsername.text! + ","+"\n Profile has been updated!"
            
            if returnCode == false{
                        returnMSG = "User updates failed"
                    }
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


