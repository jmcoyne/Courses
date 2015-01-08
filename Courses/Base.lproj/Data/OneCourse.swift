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
    private(set) var id: String
    private(set) var name: String
    private(set) var sectionId: String
    private(set) var description: String
    private(set) var mediaURL: String
    private(set) var videoURL: String
    private(set) var courseImageURL: String
    private(set) var courseXsmallURL: String
    private(set) var courseSmallURL: String
    private(set) var courseMediumURL: String
    private(set) var courseLargeURL: String
    private(set) var courseCreatedAt: String
    private(set) var courseUpdatedAt: String
    private(set) var commentsCount: String
    private(set) var cachedVotesUp: String
    private(set) var cachedVotesDown: String
    
    
    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var courseImage: UIImage {
        return UIImage(named: courseImageURL)!
    }
    
    init(id: String, name: String, sectionId: String, description: String?, mediaURL: String, videoURL: String?, courseImageURL: String?, courseXsmallURL: String?, courseSmallURL: String?, courseMediumURL: String?, courseLargeURL: String?, courseCreatedAt: String, courseUpdatedAt: String, commentsCount: String?, cachedVotesUp: String?, cachedVotesDown: String?) {
        
        
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
        self.cachedVotesUp = cachedVotesUp  ?? ""
        self.cachedVotesDown = cachedVotesDown  ?? ""
        
        

    }
}
