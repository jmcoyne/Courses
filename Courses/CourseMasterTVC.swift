//  CourseMasterTVC.swift
//  Courses
//
//  Created by Joan Coyne on 12/10/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import UIKit

class CourseMasterTVC: UITableViewController {
     var recentCourses = [CourseListing]()
    //var organizationId = String()
    

        var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers.last?.topViewController as? DetailViewController
        
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        DataManager.getCoursesBySectionDataFromFileWithSuccess { (data) -> Void in
            
            //TODO - Get right Organization
            var Sections: [String: String] = ["1": "Design", "2": "Human Resources"]
            println("SwiftyJSON: Here is the sections section")
            let json = JSON(data: data)
            //Get array of Sections:
            for (sectionId, thisSection) in Sections {
                
                if let courses = json[thisSection].arrayValue {
                    
                    println("SwiftyJSON: There are \(courses.count) courses in \(thisSection)")
                    for course in courses {
                        var id: String?  = course["id"].stringValue
                        var name: String?  = course["name"].stringValue
                        var description: String?  = course["description"].stringValue
                        var commentCount: String?  = course["comments_count"].stringValue
                        var createdAt: String? = course["created_at"].stringValue
                        var updatedAt: String? = course["updated_at"].stringValue
                        var mediaURL: String?  = course["media_url"].stringValue
                        var videoURL: String?  = course["panda_video_url"].stringValue

                        var imageURL: String?  = course["url"].stringValue

                        var xsmallURL: String? = course["xsmall"]["url"].stringValue
                        var smallURL: String?  = course["small"]["url"].stringValue
                        var mediumURL: String? = course["medium"]["url"].stringValue
                        var largeURL: String?  = course["large"]["url"].stringValue
                        
                        var oneCourse = CourseListing(id: id!, name: name!, sectionId: sectionId,  description: description, mediaURL: mediaURL!, videoURL: videoURL, courseImageURL: imageURL, courseXsmallURL: xsmallURL, courseSmallURL: smallURL, courseMediumURL: mediumURL, courseLargeURL: largeURL, courseCreatedAt: createdAt!, courseUpdatedAt: updatedAt!, commentsCount: commentCount)
                        self.recentCourses.append(oneCourse);
                    }
                   
                }
                
            }
            
            
        }

     
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.recentCourses.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("One Class", forIndexPath: indexPath) as CourseTableViewCell
         var course : CourseListing
        course = recentCourses[indexPath.row]
        // Configure the cell...
        cell.courseTitleLabel.text = course.name;
        cell.courseDescriptionTextView.text    = course.description
        //cell.courseImageView.image = course.courseImage
               //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
   
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad) {
            // Check to see if there are any child classes in this section.  IF there are, show the indicator
            //if rowHasChildrenAtIndex(indexPath) {
                cell.accessoryType = .DisclosureIndicator
            //} else{
              //  cell.accessoryType = .None
            //}
            
        }
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
            if segue.identifier == "CourseDetail" {
               // let detailNav = segue.destinationViewController as UINavigationController
               // let detailVC  = detailNav.topViewController as DetailViewController
                let detailVC  = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
               let course   = self.recentCourses[self.tableView!.indexPathForSelectedRow()!.row]
               detailVC.courseNameLabel?.text = course.name
              // detailVC.oneCourse = course
                detailVC.title = "Mzinga"
                NSLog("Course name %@", course.name)
                 NSLog("Course name %@", course.id)


                //}
        
                
           
            
        }

    }
    
}
