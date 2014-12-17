//
//  Organization.swift
//  Courses
//
//  Created by Joan Coyne on 12/17/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation

@objc class Organization {
    private(set) var id: String
    private(set) var name: String
    private(set) var subdomain: String
    private(set) var status: String
    private(set) var createdAt: String
    private(set) var updatedAt: String
    
    
    
    
    init(id: String, name: String, subdomain: String, status: String, createdAt: String,updatedAt: String) {
        self.name = name
        self.id = id
        self.subdomain = subdomain
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        
    }
}
