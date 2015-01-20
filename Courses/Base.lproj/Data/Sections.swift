//
//  Sections.swift
//  Courses
//
//  Created by Joan Coyne on 1/20/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import Foundation
import UIKit

class Section {
    let id: String
    let imageURL: String
    let xsmallURL: String
    let smallURL: String
    let mediumURL: String
    let largeURL: String
    let name: String
    let createdAt: String
    let updatedAt: String
    
    // SO right now, the imageURL is just the name of the image just to make it easier
    var sectionImage: UIImage {
        return UIImage(named: imageURL)!
    }
    
    init(id: String, name: String?, imageURL: String?,xsmallURL: String?,smallURL: String?,mediumURL: String?,largeURL: String?,  createdAt: String,updatedAt: String) {
        
        self.id = id
        self.imageURL = imageURL ?? ""
        self.xsmallURL = xsmallURL ?? ""
        self.smallURL = smallURL ?? ""
        self.mediumURL = mediumURL ?? ""
        self.largeURL = largeURL ?? ""
        self.name = name ?? ""
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        
    }
}

