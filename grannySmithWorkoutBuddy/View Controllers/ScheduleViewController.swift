//
//  ScheduleViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by HaominChen on 2022-04-07.
//

import UIKit
import UserNotifications

class ScheduleViewController: UIViewController, UITextFieldDelegate {
 
    @IBOutlet var tfReminder : UITextField!
    @IBOutlet var datePicker : UIDatePicker!
    //set variable notificationCenter
    let notificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Ask the user for permission, assume user allows
        notificationCenter.requestAuthorization(options: .alert) {
            (permissionGranted, error) in
            if(!permissionGranted)
            {
                print("Permission Denied")
            }
        }
    }
    
    //keyborad will disappear when user finish data input
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    //handle schedule settings
    @IBAction func scheduleAction(sender : UIButton){
        //setup notifications
        notificationCenter.getNotificationSettings { (settings) in
            
            DispatchQueue.main.async
            {
                let message = self.tfReminder.text!
                let date = self.datePicker.date
                //check if user allows to send notification
                if(settings.authorizationStatus == .authorized)
                {
                    //set notification content
                    let content = UNMutableNotificationContent()
                    content.title = "Gentle reminder for you"
                    content.body = message
                    
                    let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                    //set trigger to compare now and scheduled time
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                    //add trigger to a request
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    //give error if request add failed
                    self.notificationCenter.add(request) { (error) in
                        if(error != nil)
                        {
                            print("Error " + error.debugDescription)
                            return
                        }
                    }
                    //set alert window
                    let ac = UIAlertController(title: "Notification Scheduled", message: "At " + self.formattedDate(date: date), preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                    self.present(ac, animated: true)
                }
            }
        }
    }
    
    //set date format
    func formattedDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        //set data format as date month year hour:minute
        formatter.dateFormat = "d MMM y HH:mm"
        return formatter.string(from: date)
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


