//
//  User.swift
//  Courses
//
//  Created by Joan Coyne on 12/17/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation
import UIKit



@objc class User {
    private(set) var id: String
    private(set) var email: String
    private(set) var imageURL: String
    private(set) var xsmallURL: String
    private(set) var smallURL: String
    private(set) var mediumURL: String
    private(set) var largeURL: String
    private(set) var firstName: String
    private(set) var lastName: String
    private(set) var city: String
    private(set) var state: String
    private(set) var createdAt: String
    private(set) var updatedAt: String
    private(set) var memberships: Membership
    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var userImage: UIImage {
        return UIImage(named: imageURL)!
    }
    
    init(id: String, email: String, imageURL: String,xsmallURL: String,smallURL: String,mediumURL: String,largeURL: String, firstName: String, lastName: String, city: String, state: String, createdAt: String,updatedAt: String,memberships:Membership) {
        
        self.id = id
        self.email = email
        self.imageURL = imageURL
        self.xsmallURL = xsmallURL
        self.smallURL = smallURL
        self.mediumURL = mediumURL
        self.largeURL = largeURL
        self.firstName = firstName
        self.lastName  = lastName
        self.city = city
        self.state  = state
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.memberships = memberships
       
        
    }
}

