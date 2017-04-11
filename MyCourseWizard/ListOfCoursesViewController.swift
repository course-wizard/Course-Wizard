//
//  ListOfCoursesViewController.swift
//  MyCourseWizard
//
//  Created by Yaowen Wang on 4/5/17.
//  Copyright © 2017 Yaowen Wang. All rights reserved.
//

import UIKit

class ListOfCoursesViewController: UIViewController,UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var listOfCoursesTableView: UITableView!

    var selectedSchool = ""
    var selectedDepartment = ""
    var courses : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfCoursesTableView.delegate = self
        listOfCoursesTableView.dataSource = self
        searchBar.delegate = self
        
        courses = fetchCourses(selectedDepartment)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfListOfCourses", for: indexPath)
        cell.textLabel?.text = courses[indexPath.row]
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    
    @IBAction func sortByTeachers(_ sender: UIButton) {
    }

    
    @IBAction func sortByClasses(_ sender: UIButton) {
    }


    func fetchCourses(_ department: String) -> [String] {
        let coursesModel = ModelOfListCourses()
        return coursesModel.coursesDictionary[department]!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if (segue.identifier == "segueToDepartments") {
//            let selecedSchool = schools[(listOfSchoolsTableView.indexPathForSelectedRow?.row
//                )!]
//            let listOfDepartments = segue.destination as! ListOfDepartmentsTableViewController
//            listOfDepartments.selectedSchools = selecedSchool
//        }
        
        if (segue.identifier == "segueToReviews") {
            let selectedCourse = courses[(listOfCoursesTableView.indexPathForSelectedRow?.row
                )!]
            
            let listOfReviews = segue.destination as! ListOfReviewsViewController
            listOfReviews.courseName = selectedCourse
            listOfReviews.selectedSchool = selectedSchool
            listOfReviews.selectedDepartment = selectedDepartment
        }

    }
    

    
    

}
