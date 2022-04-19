/*
 Author: Christopher Lewis
 The code below is used to control the Exercise Table View Controller. The goal of the View Controller is to take the exercises from the database and display them in a table format. The user can then click on an individual exercise to open up a web page with more information on the exercise. The user can also use the search bar to easily find the exercise they're looking for.
 */


import UIKit

class ExerciseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate //creating a variable to shortcut getting from the App Delegate
    var filteredData: [Exercise]! = [] //holds the exercises based on the search
    
    @IBOutlet var searchBar:UISearchBar!
    @IBOutlet var table:UITableView!
    
    //for unwinding segues
    @IBAction func unwindToExerciseViewController(sender: UIStoryboardSegue) {
        
    }
    
    //determines the amount of rows in the table based on size of the filtered exercise data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count //number of rows must be based on the filtered results and not the total number of exercises
    }
    
    //determines the height of the table rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //creates the cells based on the ExerciseSiteCell class. Then assigns the exercise information to the labels in the custom cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExerciseSiteCell ?? ExerciseSiteCell(style: .default, reuseIdentifier: "cell") //reuses a cell if possible or creates a new Exercise Site Cell
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = filteredData[rowNum].exerciseName
        tableCell.secondaryLabel.text = filteredData[rowNum].muscleGroup
        tableCell.accessoryType = .disclosureIndicator //adding an indicator to get users to click on the table row
        
        return tableCell
    }
    
    //when you click a table row it opens the website for that exercise
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        mainDelegate.selectedURL = mainDelegate.exercises[rowNum].webLink!
        performSegue(withIdentifier: "SegueToWeb", sender: nil)
    }
    
    //function for the search bar. When the text in the search bar changes it empties the filteredData. If you empty the search bar then it returns all the stored exercises. Otherwise, it returns exercises that contain what you type in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = mainDelegate.exercises
        } else {
            for exercise in mainDelegate.exercises {
                if exercise.exerciseName?.lowercased().contains(searchText.lowercased()) != nil && exercise.exerciseName?.lowercased().contains(searchText.lowercased()) == true { //must check whether the search text matches any exercises from the database via the App Delegate
                    filteredData.append(exercise)
                }
            }
        }
        
        table.reloadData() //reload the table whenever the search text changes
    }

    //upon loading the view it calls the AppDelegate to read the exercises from the database and starts the filtered data as having all exercises
    override func viewDidLoad() {
        super.viewDidLoad()

        mainDelegate.readExerciseFromDatabase() //getting the App Delegate to read from the database immediately to fill out the table
        searchBar.delegate = self
        
        filteredData = mainDelegate.exercises //having filtered data start off as all exercises
    }
}
