//
//  ProfileViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-03-29.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbGoal: UILabel!
    @IBOutlet var lbFitness : UILabel!
    @IBOutlet var imgAvatar : UIImageView!
    
    @IBAction func unwindToProfileViewController(sender:UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
      
        mainDelegate.readUserDataFromDatabase()
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
