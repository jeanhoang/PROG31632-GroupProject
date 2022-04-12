//
//  ViewWeightViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-04-11.
//

import UIKit

class ViewWeightViewController: UIViewController {
    
    @IBOutlet var lblWeight : UILabel!
    @IBOutlet var lblDate : UILabel!
    
    var weightValue = ""
    var dateValue = ""
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWeight.text = weightValue
        lblDate.text = dateValue
        
        //text = weightValue + dateValue

    }
    
    @IBAction func shareWeight(_sender : UIButton) {
        
        let textToShare = [weightValue]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
        
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
