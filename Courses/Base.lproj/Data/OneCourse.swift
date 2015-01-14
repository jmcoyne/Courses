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
    let id: String
    let name: String
    let sectionId: String
    let description: String
    let mediaURL: String
    let videoURL: String
    let courseImageURL: String
    let courseXsmallURL: String
    let courseSmallURL: String
    let courseMediumURL: String
    let courseLargeURL: String
    let courseCreatedAt: String
    let courseUpdatedAt: String
    let commentsCount: String
    let comments = [Comment]()
    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var courseImage: UIImage {
        return UIImage(named: courseImageURL)!
    }
    
    init(id: String, name: String, sectionId: String, description: String?, mediaURL: String, videoURL: String?, courseImageURL: String?, courseXsmallURL: String?, courseSmallURL: String?, courseMediumURL: String?, courseLargeURL: String?, courseCreatedAt: String, courseUpdatedAt: String, commentsCount: String?, comments:[Comment]) {
        
        
        self.id = id
        self.name = name
        self.sectionId = sectionId
        self.description = description  ?? ""
        self.mediaURL = mediaURL
        self.videoURL = videoURL ?? ""
        self.courseImageURL = courseImageURL ?? ""
        self.courseXsmallURL = courseXsmallURL ?? ""
        self.courseSmallURL = courseSmallURL ?? ""
        self.courseMediumURL = courseMediumURL ?? ""
        self.courseLargeURL = courseLargeURL ?? ""
        self.courseCreatedAt = courseCreatedAt
        self.courseUpdatedAt = courseUpdatedAt
        self.commentsCount = commentsCount  ?? ""
        
        

    }
}
