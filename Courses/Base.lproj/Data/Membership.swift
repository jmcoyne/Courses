//
//  Membership.swift
//  Courses
//
//  Created by Joan Coyne on 12/17/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation
import Foundation

@objc class Membership {
    private(set) var status: String
    private(set) var role: String
    private(set) var createdAt: String
    private(set) var updatedAt: String
    private(set) var organizations: Organization
    
    
    init(status: String, role: String, createdAt: String,updatedAt: String,organizations: Organization) {
        self.status = status
        self.role = role
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.organizations = organizations
    }
}

