//
//  OneCourse.swift
//  Courses
//
//  Created by Joan Coyne on 12/9/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation
import UIKit

@objc class OneCourse {
    private(set) var courseName: String
    private(set) var courseDescription: String
    // SO right now, the name of the image is the name of the course just to make it easier
    var courseImage: UIImage {
        return UIImage(named: courseName)!
    }
    
    init(courseName: String, courseDescription: String) {
        self.courseName = courseName
        self.courseDescription = courseDescription
    }
}
