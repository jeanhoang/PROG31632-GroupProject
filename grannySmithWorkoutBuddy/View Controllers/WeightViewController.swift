//
//  WeightViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-03-29.
//

import UIKit

class WeightViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func unwindToWeightViewController(sender:UIStoryboardSegue) {}
    
    @IBOutlet var lblView: UILabel!
    @IBOutlet var tfWeight : UITextField!
    
    @IBOutlet var dateLog : UIDatePicker!
    
    
    //Get rid of keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        //Submit
        let viewFrame : CGRect = lblView.frame
        
        if (viewFrame.contains(touchPoint)) {
            //rememberInputData()
            performSegue(withIdentifier: "WeightToWeightLogSegue", sender: self)
        }
    }
    
    //Add a weight
    @IBAction func addWeight(sender : Any) {
        let mainDelegte = UIApplication.shared.delegate as! AppDelegate
        
        //Handling date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let dateInput : String = dateFormatter.string(from: dateLog.date)
        
        let weightInput : Weight = Weight.init()
        weightInput.initWithData(theRow: 0, theWeight: Int(tfWeight.text!) ?? 0, theDate: dateInput)
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //Insert
        let returnCode = mainDelegte.insertWeightintoDatabase(userWeight: weightInput)
        var returnMSG : String = "Weight Added"
        
        if returnCode == false {
            returnMSG = "Weight add failed"
        }
        
        let alertController = UIAlertController(title: "Weight Log Notification", message: returnMSG, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

           //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
           tap.cancelsTouchesInView = false

           view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    //Dismiss keyboard
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
