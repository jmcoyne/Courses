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
    
    var oneCourse: OneCourse?
        /*{
        didSet {
            self.configureView()
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DataManager.getOneCourseDataFromFileWithSuccess { (data) -> Void in
            
            
           
            NSLog("Here we are getting a class")
            let json = JSON(data: data)
            var courseId: String?  = json["course"]["id"].stringValue
            var courseName: String?  = json["course"]["name"].stringValue
            var courseDescription: String?  = json["course"]["description"].stringValue
            var commentCount: String?  = json["course"]["comments_count"].stringValue
            var createdAt: String? = json["course"]["created_at"].stringValue
            var updatedAt: String? = json["course"]["updated_at"].stringValue
            var imageURL: String?  = json["course"]["image"]["image"]["url"].stringValue
            var xsmallURL: String? = json["course"]["image"]["image"]["xsmall"]["url"].stringValue
            var smallURL: String?  = json["course"]["image"]["image"]["small"]["url"].stringValue
            var mediumURL: String? = json["course"]["image"]["image"]["medium"]["url"].stringValue
            var largeURL: String?  = json["course"]["image"]["image"]["large"]["url"].stringValue
            var sectionId: String?  = json["course"]["section"]["id"].stringValue
            var sectionName: String?  = json["course"]["section"]["name"].stringValue
            

            
            self.oneCourse = OneCourse(courseId: courseId!, courseName: courseName!, sectionId: sectionId!, sectionName: sectionName!, courseDescription: courseDescription, courseImageURL: imageURL, courseXsmallURL: xsmallURL, courseSmallURL: smallURL, courseMediumURL: mediumURL, courseLargeURL: largeURL, courseCreatedAt: createdAt!, courseUpdatedAt: updatedAt!, commentsCount: commentCount)
                
            }
            
            
        
        

        
        
        self.configureView()

        // Do any additional setup after loading the view.
    }
    
    

    private func configureView() {
        if let course = oneCourse? {
        //courseImageView.image. = oneCourse?.courseImageURL
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
