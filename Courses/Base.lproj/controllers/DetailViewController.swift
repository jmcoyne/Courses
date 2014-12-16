//
//  DetailViewController.swift
//  Courses
//
//  Created by Joan Coyne on 12/10/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 
    
    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    var oneCourse: Course? {
        didSet {
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

        // Do any additional setup after loading the view.
    }
    
    

    private func configureView() {
        if let course = oneCourse? {
        //courseImageView.image = oneCourse?.courseImage
        courseNameLabel?.text = course.courseName
        sectionLabel?.text = course.courseDescription
           //courseNameLabel?.text = "Hey there!"
          //  sectionLabel?.text = "Ho There!"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
