/*
 Author: Christopher Lewis
 The code below is used to control the Exercise Table View Controller. The goal of the View Controller is to take the exercises from the database and display them in a table format. The user can then click on an individual exercise to open up a web page with more information on the exercise. The user can also use the search bar to easily find the exercise they're looking for.
 */


import UIKit

class ExerciseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    var filteredData: [Exercise]! = []
    
    @IBOutlet var searchBar:UISearchBar!
    @IBOutlet var table:UITableView!
    
    @IBAction func unwindToExerciseViewController(sender: UIStoryboardSegue) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExerciseSiteCell ?? ExerciseSiteCell(style: .default, reuseIdentifier: "cell")
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = filteredData[rowNum].exerciseName
        tableCell.secondaryLabel.text = filteredData[rowNum].muscleGroup
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        mainDelegate.selectedURL = mainDelegate.exercises[rowNum].webLink!
        performSegue(withIdentifier: "SegueToWeb", sender: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = mainDelegate.exercises
        } else {
            for exercise in mainDelegate.exercises {
                if exercise.exerciseName?.lowercased().contains(searchText.lowercased()) != nil && exercise.exerciseName?.lowercased().contains(searchText.lowercased()) == true {
                    filteredData.append(exercise)
                }
            }
        }
        
        table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate.readExerciseFromDatabase()
        searchBar.delegate = self
        
        filteredData = mainDelegate.exercises
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
