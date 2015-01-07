//
//  Lesson.swift
//  Courses
//
//  Created by Joan Coyne on 1/6/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import Foundation
import UIKit

@objc class Lesson {
    private(set) var id: String
    private(set) var title: String
    private(set) var mediaURL: String
    private(set) var videoId: String
    private(set) var courseId: String
    private(set) var description: String
    private(set) var lessonImageURL: String
    private(set) var lessonXsmallURL: String
    private(set) var lessonSmallURL: String
    private(set) var lessonMediumURL: String
    private(set) var lessonLargeURL: String
    private(set) var createdAt: String
    private(set) var updatedAt: String
    
    var lessonImage: UIImage {
        return UIImage(named: lessonImageURL)!
    }
    
    
    init(id: String, title: String, mediaURL: String,  videoId: String, courseId: String, description: String?, lessonImageURL: String?, lessonXsmallURL: String?, lessonSmallURL: String?, lessonMediumURL: String?, lessonLargeURL: String?,createdAt: String,updatedAt: String) {
        self.title = title
        self.id = id
        self.mediaURL = mediaURL
        self.videoId = videoId
        self.courseId = courseId
        self.description = description  ?? ""
        self.lessonImageURL = lessonImageURL ?? ""
        self.lessonXsmallURL = lessonXsmallURL ?? ""
        self.lessonSmallURL = lessonSmallURL ?? ""
        self.lessonMediumURL = lessonMediumURL ?? ""
        self.lessonLargeURL = lessonLargeURL ?? ""
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        
    }
}
