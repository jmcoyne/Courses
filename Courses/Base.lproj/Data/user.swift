//
//  User.swift
//  Courses
//
//  Created by Joan Coyne on 12/17/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import Foundation
import UIKit



class User {
    let id: String
    let email: String
    let imageURL: String
    let xsmallURL: String
    let smallURL: String
    let mediumURL: String
    let largeURL: String
    let firstName: String
    let lastName: String
    let city: String
    let state: String
    let createdAt: String
    let updatedAt: String
    let memberships: [Membership]
    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var userImage: UIImage {
        return UIImage(named: imageURL)!
    }
    
    init(id: String, email: String, imageURL: String?,xsmallURL: String?,smallURL: String?,mediumURL: String?,largeURL: String?, firstName: String?, lastName: String?, city: String?, state: String?, createdAt: String,updatedAt: String,memberships:[Membership]) {
        
        self.id = id
        self.email = email
        self.imageURL = imageURL ?? ""
        self.xsmallURL = xsmallURL ?? ""
        self.smallURL = smallURL ?? ""
        self.mediumURL = mediumURL ?? ""
        self.largeURL = largeURL ?? ""
        self.firstName = firstName ?? ""
        self.lastName  = lastName ?? ""
        self.city = city ?? ""
        self.state  = state ?? ""
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.memberships = memberships
       
        
    }
}

