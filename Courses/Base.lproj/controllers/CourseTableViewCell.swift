//
//  CourseTableViewCell.swift
//  Courses
//
//  Created by Joan Coyne on 12/9/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var courseTitleLabel: UILabel!
  
   
    @IBOutlet weak var courseDescriptionTextField: UITextField!
    
    // MARK: - Properties
    var oneCourse: Course? {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - Utility methods
    private func configureCell() {
        //courseImageView.image = oneCourse?.courseImage
        courseTitleLabel.text = oneCourse?.courseName
         courseDescriptionTextField.text = oneCourse?.courseDescription
    }
    
}
