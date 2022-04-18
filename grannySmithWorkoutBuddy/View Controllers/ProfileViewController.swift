//
//  ProfileViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Haomin Chen 2022-03-29.
//

import UIKit

class ProfileViewController: UIViewController {
    // access to appdelegate
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbGoal: UILabel!
    @IBOutlet var lbFitness : UILabel!
    @IBOutlet var imgAvatar : UIImageView!
    //unwind to profile view controller
    @IBAction func unwindToProfileViewController(sender:UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        // read user data from database
        mainDelegate.readUserDataFromDatabase()
        //set user data to ui in the viewcontroller
        lbName.text = mainDelegate.people[0].username
        lbGoal.text = mainDelegate.people[0].goal
        lbFitness.text = mainDelegate.people[0].fitness
        imgAvatar.image = UIImage(named: mainDelegate.people[0].avatar!)
        // Do any additional setup after loading the view.
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
