//
//  Comment.swift
//  Courses
//
//  Created by Joan Coyne on 1/14/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import Foundation

@objc class Comment {
    let id: String
    let userId: String
    let body: String
    let createdAt: String
    let updatedAt: String
    
    
    
    init(id: String, userId: String, body: String?, createdAt: String?, updatedAt: String?) {
        self.id = id
        self.userId = userId
        self.body = body ?? ""
        self.createdAt = createdAt ?? ""
        self.updatedAt = updatedAt ?? ""
        
    }
}
