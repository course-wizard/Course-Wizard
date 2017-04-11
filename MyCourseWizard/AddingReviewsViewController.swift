//
//  AddingReviewsViewController.swift
//  MyCourseWizard
//
//  Created by Yaowen Wang on 4/5/17.
//  Copyright © 2017 Yaowen Wang. All rights reserved.
//

import UIKit
import CoreData

class AddingReviewsViewController: UIViewController {
    

    @IBOutlet weak var reviewTextField: UITextField!
    
    var selectedSchool = ""
    var selectedDepartment = ""
    var selectedCourse = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func addingReviewsButton(_ sender: UIButton) {
        saveCourseReview(review: reviewTextField.text!, school: self.selectedSchool, department: self.selectedDepartment, course: self.selectedCourse)
    }

    func saveCourseReview(review: String, school: String, department: String, course: String ) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let reviews = Reviews(context:context)
        reviews.course = course
        reviews.school = school
        reviews.department = department
        reviews.reviews = review
        
        try? context.save()
    }
    

}
