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
    private(set) var courseId: String
    private(set) var courseName: String
    private(set) var sectionId: String
    private(set) var sectionName: String
    private(set) var courseDescription: String
    private(set) var courseImageURL: String
    private(set) var courseXsmallURL: String
    private(set) var courseSmallURL: String
    private(set) var courseMediumURL: String
    private(set) var courseLargeURL: String
    private(set) var courseCreatedAt: String
    private(set) var courseUpdatedAt: String
    private(set) var CommentsCount: String
    private(set) var lessons: [Lesson]

    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var courseImage: UIImage {
        return UIImage(named: courseImageURL)!
    }
    
    init(courseId: String, courseName: String, sectionId: String, sectionName: String, courseDescription: String?, courseImageURL: String?, courseXsmallURL: String?, courseSmallURL: String?, courseMediumURL: String?, courseLargeURL: String?, courseCreatedAt: String, courseUpdatedAt: String, commentsCount: String?,lessons:[Lesson]) {
        
        
        self.courseId = courseId
        self.courseName = courseName
        self.sectionId = sectionId
        self.sectionName = sectionName
        self.courseDescription = courseDescription  ?? ""
        self.courseImageURL = courseImageURL ?? ""
        self.courseXsmallURL = courseXsmallURL ?? ""
        self.courseSmallURL = courseSmallURL ?? ""
        self.courseMediumURL = courseMediumURL ?? ""
        self.courseLargeURL = courseLargeURL ?? ""
        self.courseCreatedAt = courseCreatedAt
        self.courseUpdatedAt = courseUpdatedAt
        self.CommentsCount = commentsCount  ?? ""
        self.lessons = lessons

        

    }
}
