//
//  ModelOfListOfCourses.swift
//  MyCourseWizard
//
//  Created by Yaowen Wang on 4/6/17.
//  Copyright © 2017 Yaowen Wang. All rights reserved.
//

import Foundation

struct ModelOfListCourses {
    
    func fetchListOfCourses(_ school: String, of department: String)  {
        
    }
    
    var CSCourses = ["Mobile Application Development", "Introduction to Machine Learning"]
    var EECourses = ["Optimization", "State Space Control System Design"]
    var PHcourses = ["Global Burden of Disease: Methods and Applications","Foundations of Public Health: Biostatiscs"]
    var SWCourses = ["Policy and Services for Children and Youth", "Health Administration and Policy"]
    
    var coursesDictionary: Dictionary = [
        "Computer Science": ["Mobile Application Development", "Introduction to Machine Learning"],
        "Electrical Engineering": ["Optimization", "State Space Control System Design"],
        "Public Health": ["Global Burden of Disease: Methods and Applications","Foundations of Public Health: Biostatiscs"],
        "Social Work": ["Policy and Services for Children and Youth", "Health Administration and Policy"]
    ]
    
}
