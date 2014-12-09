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
  
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    
    // MARK: - Properties
    var oneCourse: OneCourse? {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - Utility methods
    private func configureCell() {
        courseImageView.image = oneCourse?.courseImage
        courseTitleLabel.text = oneCourse?.courseName
         courseDescriptionLabel.text = oneCourse?.courseDescription
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
