//
//  CommentsTVCell.swift
//  Courses
//
//  Created by Joan Coyne on 1/14/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import UIKit

class CommentsTVCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var posterCommentTextView: UITextView!
    // MARK: - Properties
    var oneComment: Comment? {
        didSet {
            configureCommentCell()
        }
    }
    
    // MARK: - Utility methods
    private func configureCommentCell() {
        //courseImageView.image = oneCourse?.courseImage
      //  courseTitleLabel.text = oneCourse?.name
      //  courseDescriptionTextView.text = oneCourse?.description
        //  let courseId  = oneCourse?.courseId
        // NSlog("here is my courseId \(courseId)")
    }
    

}
