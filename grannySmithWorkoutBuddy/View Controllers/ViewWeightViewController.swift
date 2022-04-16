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
    @IBOutlet var lblQuote : UILabel!
    
    var weightValue = ""
    var dateValue = ""
    var motivation = ""
    
    //Populate motivational quotes
    let quotes = ["Stop wishing, start doing",
                  "Persistence is key",
                  "Excuses don't burn calories"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //VC title
        title = "View Weight"
        
        //Load chosen weight/date
        lblWeight.text = weightValue
        lblDate.text = dateValue
        
        //Load quote randomly
        motivation = quotes.randomElement()!
        lblQuote.text = motivation
        
    }
    
    
    //Share quote
    @IBAction func shareWeight(_sender : UIButton) {
        
        let textToShare = [motivation]
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
