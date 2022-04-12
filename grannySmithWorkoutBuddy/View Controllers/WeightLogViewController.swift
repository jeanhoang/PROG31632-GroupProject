//
//  WeightLogViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-04-10.
//

import UIKit

class WeightLogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func unwindToWeightLogViewController(sender: UIStoryboardSegue) {}
    //Access app delegate
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.userWeight.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? WeightSiteCell ?? WeightSiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        
        tableCell.weightLabel.text = String(mainDelegate.userWeight[rowNum].weight ?? 0)
        tableCell.dateLabel.text = mainDelegate.userWeight[rowNum].date
        
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        let viewWeight = (storyboard?.instantiateViewController(identifier: "ViewWeightController") as? ViewWeightViewController)!
        
        viewWeight.weightValue = String(mainDelegate.userWeight[rowNum].weight ?? 0)
        viewWeight.dateValue = mainDelegate.userWeight[rowNum].date!
        
        self.navigationController?.pushViewController(viewWeight, animated: true)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainDelegate.readWeightFromDatabase()

    }
    


}
