//
//  OneCourse.swift
//  Courses
//
//  Created by Joan Coyne on 12/9/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation
import UIKit

@objc class Course {
    private(set) var courseName: String
    private(set) var courseImageURL: String
    private(set) var courseDescription: String
    private(set) var courseCreatedAt: String
    private(set) var courseUpdatedAt: String
    private(set) var courseCommentsCount: String

    private(set) var courseSectionId: String
    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var courseImage: UIImage {
        return UIImage(named: courseImageURL)!
    }
    
    init(name: String, description: String, imageURL: String, createdAt: String,updatedAt: String,commentsCount: String,sectionId: String) {
        self.courseName = name
        self.courseDescription = description
        self.courseCreatedAt = createdAt
        self.courseUpdatedAt = updatedAt
        self.courseCommentsCount = commentsCount
        self.courseSectionId = sectionId
        self.courseImageURL = imageURL

    }
}
