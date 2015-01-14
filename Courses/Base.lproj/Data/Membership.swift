//
//  Membership.swift
//  Courses
//
//  Created by Joan Coyne on 12/17/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation

@objc class Membership {
    let status: String
    let role: String
    let createdAt: String
    let updatedAt: String
    let organization: Organization
    
    
    init(status: String?, role: String?, createdAt: String?, updatedAt: String?, organization: Organization) {
        self.status = status ?? ""
        self.role = role ?? ""
        self.createdAt = createdAt ?? ""
        self.updatedAt = updatedAt ?? ""
        self.organization = organization
    }
}

