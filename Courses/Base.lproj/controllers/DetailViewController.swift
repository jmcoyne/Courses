//
//  DetailViewController.swift
//  Courses
//
//  Created by Joan Coyne on 12/10/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    
    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
 
    @IBOutlet weak var lessonTableView: UITableView!
    
    var oneCourse: OneCourse?
    var lessons = [Lesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.lessonTableView.registerNib(UINib(nibName: "UICustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Lesson Cell")
        
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
            
            if let lessonArray = json["course"]["lessons"].arrayValue {
                 for lessonDict in lessonArray {
                    var lessonId: String? = lessonDict["id"].stringValue
                    var lessonTitle: String? = lessonDict["title"].stringValue
                    var lessonMediaUrl: String? = lessonDict["media_url"].stringValue
                    var lessonVideoId: String? = lessonDict["panda_video_id"].stringValue
                    var lessonCourseId: String? = lessonDict["course_id"].stringValue
                    var lessonDescription: String? = lessonDict["description"].stringValue
                    var lessonCreatedAt: String? = lessonDict["created_at"].stringValue
                    var lessonUpdatedAt: String? = lessonDict["updated_at"].stringValue
                    var lessonImageURL: String?  = lessonDict["image"]["url"].stringValue
                    var lessonXsmallURL: String? = lessonDict["image"]["xsmall"]["url"].stringValue
                    var lessonSmallURL: String?  = lessonDict["image"]["small"]["url"].stringValue
                    var lessonMediumURL: String? = lessonDict["image"]["medium"]["url"].stringValue
                    var lessonLargeURL: String?  = lessonDict["image"]["large"]["url"].stringValue


                    var lesson = Lesson(id: lessonId!, title: lessonTitle!, mediaURL: lessonMediaUrl!, videoId: lessonVideoId!, courseId: lessonCourseId!, description: lessonDescription, lessonImageURL: lessonImageURL, lessonXsmallURL: lessonXsmallURL, lessonSmallURL: lessonSmallURL, lessonMediumURL: lessonMediumURL, lessonLargeURL: lessonLargeURL, createdAt: lessonCreatedAt!, updatedAt: lessonUpdatedAt!)
                    self.lessons.append(lesson)
                }
            }
            
            self.oneCourse = OneCourse(courseId: courseId!, courseName: courseName!, sectionId: sectionId!, sectionName: sectionName!, courseDescription: courseDescription, courseImageURL: imageURL, courseXsmallURL: xsmallURL, courseSmallURL: smallURL, courseMediumURL: mediumURL, courseLargeURL: largeURL, courseCreatedAt: createdAt!, courseUpdatedAt: updatedAt!, commentsCount: commentCount,lessons: self.lessons)
                
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
    
    // Mark: - Table View Delegate
    
    // MARK: - Table view data source
    
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        //NSLog("Count: \(self.organizations.count)")
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCellWithIdentifier("Lesson Cell", forIndexPath: indexPath) as UITableViewCell
          var lessonCell:UITableViewCell = self.lessonTableView.dequeueReusableCellWithIdentifier("Lesson Cell") as UITableViewCell
        // Configure the cell...
        lessonCell.textLabel?.text =  self.lessons[indexPath.row].title
        // cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return lessonCell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
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
