//
//  WeightLogViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-04-10.
//

import UIKit

class WeightLogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBAction func unwindToWeightViewController(sender: UIStoryboardSegue) {}
    //Access app delegate
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    //Return number of row from table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.userWeight.count
    }
    
    //Define height for each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //Populate cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? WeightSiteCell ?? WeightSiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        
        tableCell.weightLabel.text = String(mainDelegate.userWeight[rowNum].weight ?? 0)
        tableCell.dateLabel.text = mainDelegate.userWeight[rowNum].date
        
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
    }
    
    
    //View weight details based when tap on specific cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        let viewWeight = (storyboard?.instantiateViewController(identifier: "ViewWeightController") as? ViewWeightViewController)!
        
        viewWeight.weightValue = String(mainDelegate.userWeight[rowNum].weight ?? 0)
        viewWeight.dateValue = mainDelegate.userWeight[rowNum].date!
        
        self.navigationController?.pushViewController(viewWeight, animated: true)
        
    }
    
    //Swipe left to delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //Remove a weight upon hitting delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        if editingStyle == .delete {
            mainDelegate.removeFromDatabase(id: mainDelegate.userWeight[rowNum].id!)
            mainDelegate.readWeightFromDatabase()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Define title with the use of Navigation Controller
        title = "Weight Log"
        
        //Back button
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
        
        //Retrieve weight from database
        mainDelegate.readWeightFromDatabase()
        

    }
    


}
