//
//  ListOfReviewsViewController.swift
//  MyCourseWizard
//
//  Created by Yaowen Wang on 4/5/17.
//  Copyright © 2017 Yaowen Wang. All rights reserved.
//

import UIKit
import CoreData

class ListOfReviewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var listOfReviewsTableView: UITableView!
    @IBOutlet weak var courseNameLabel: UILabel!
    var courseName = ""
    var selectedSchool = ""
    var selectedDepartment = ""
    var reviews: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfReviewsTableView.dataSource = self
        listOfReviewsTableView.delegate = self
        courseNameLabel.text = courseName
        listOfReviewsTableView.estimatedRowHeight = listOfReviewsTableView.rowHeight
        listOfReviewsTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchReviews(school: selectedSchool, department: selectedDepartment, course: courseName)
        listOfReviewsTableView.reloadData()
    }

    func fetchReviews(school: String, department: String, course: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest = Reviews.fetchRequest()
        let predicate = NSPredicate(format: "course = %@ AND school = %@ AND department = %@", courseName, selectedSchool, selectedDepartment)
        request.predicate = predicate
        var reviews = try? context.fetch(request)
        self.reviews = []
        if (reviews?.count)! > 0 {
            for index in 0...(reviews?.count)! - 1 {
                self.reviews.append((reviews?[index].reviews!)!)
                
            }
        }
        reviewsCountLabel.text = "\((reviews?.count)!) Reviews"

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOfReviews", for: indexPath) as! ReviewTableViewCell
        cell.nameLabel.text = "Anonymous"
        cell.reviewLabel.text = reviews[indexPath.row]
        return cell
    }

    @IBAction func deleteReviewsButton(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest = Reviews.fetchRequest()
        let predicate = NSPredicate(format: "course = %@ AND school = %@ AND department = %@", courseName, selectedSchool, selectedDepartment)
        request.predicate = predicate
        var reviews = try? context.fetch(request)
        context.delete((reviews?[(listOfReviewsTableView.indexPathForSelectedRow?.row)!])!)
        listOfReviewsTableView.deleteRows(at: [listOfReviewsTableView.indexPathForSelectedRow!], with: .fade)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToAddingText") {
            let addingReviews = segue.destination as! AddingReviewsViewController
            addingReviews.selectedCourse = courseName
            addingReviews.selectedDepartment = self.selectedDepartment
            addingReviews.selectedSchool = self.selectedSchool
        }

    }
  

}
