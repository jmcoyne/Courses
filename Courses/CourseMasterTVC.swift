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
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        DataManager.getCoursesDataFromFileWithSuccess { (data) -> Void in
            
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
                        var imageURL: String?  = course["url"].stringValue
                        var xsmallURL: String? = course["xsmall"]["url"].stringValue
                        var smallURL: String?  = course["small"]["url"].stringValue
                        var mediumURL: String? = course["medium"]["url"].stringValue
                        var largeURL: String?  = course["large"]["url"].stringValue
                        
                        var oneCourse = CourseListing(courseId: id!, courseName: name!, sectionId: sectionId, sectionName: thisSection, courseDescription: description, courseImageURL: imageURL, courseXsmallURL: xsmallURL, courseSmallURL: smallURL, courseMediumURL: mediumURL, courseLargeURL: largeURL, courseCreatedAt: createdAt!, courseUpdatedAt: updatedAt!, commentsCount: commentCount)
                        self.recentCourses.append(oneCourse);
                    }
                   
                }
                
            }
            
                       
        }

        
      /*  self.courses = [Course (name:"Great Class", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lacus sapien, commodo vestibulum luctus quis, porttitor ac felis. Cras fermentum mi arcu, non vehicula dolor pharetra vitae. Donec vitae leo quis dolor feugiat tempor aliquam cursus est. Morbi quis posuere urna, ut pretium nulla. In velit dui, rutrum vitae laoreet a, blandit tempor dui. Donec sollicitudin accumsan lacinia. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;",  imageURL:"mzingabeeCloseup.jpg", createdAt:"Last Week:",   updatedAt:"Last Week:", commentsCount:"5", sectionId:"1"),
            Course(name:"Great 2 Class", description:"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool. ",  imageURL:"IMG_0187.jpg", createdAt:"Yesterday",  updatedAt:"Today", commentsCount:"3", sectionId:"2"),
            Course(name:"Great 3 Class", description:"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  imageURL:"IMG_0140.jpg", createdAt:"Last Week:", updatedAt:"Last Week:", commentsCount:"8", sectionId:"3"),
            Course(name:"Great 4 Class", description:"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  imageURL:"IMG_0201.jpg", createdAt:"Last Week:", updatedAt:"Last Week:", commentsCount:"5", sectionId:"1"),
            Course(name:"Great 5 Class", description:"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  imageURL:"IMG_0223.jpg", createdAt:"Last Week:", updatedAt:"Last Week:", commentsCount:"5", sectionId:"2"),
            Course(name:"Great 6 Class", description:"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  imageURL:"IMG_0561.jpg", createdAt:"Last Week:", updatedAt:"Last Week:", commentsCount:"5", sectionId:"3"),
            Course(name:"Great 7 Class", description:"You hit me with a cricket bat. The way I see it, every life is a pile of good things and bad things.…hey.…the good things don't always soften the bad things; but vice-versa the bad things don't necessarily spoil the good things and make them unimportant. Stop talking, brain thinking. Hush. It's a fez. I wear a fez now. Fezes are cool.",  imageURL:"IMG_0021.jpg", createdAt:"Last Week:",   updatedAt:"Last Week:", commentsCount:"5", sectionId:"1"),
            Course(name:"Great 8 Class", description:"Dantooine. They're on Dantooine. The more you tighten your grip, Tarkin, the more star systems will slip through your fingers. The plans you refer to will soon be back in our hands. Partially, but it also obeys your commands. Look, I can take you as far as Anchorhead. You can get a transport there to Mos Eisley or wherever you're going. A tremor in the Force. The last time I felt it was in the presence of my old master.",  imageURL:"IMG_0095.jpg", createdAt:"Last Week:",  updatedAt:"Last Week:", commentsCount:"5", sectionId:"2"),
            Course(name:"Great 9 Class", description:"Leave that to me. Send a distress signal, and inform the Senate that all on board were killed. Don't be too proud of this technological terror you've constructed. The ability to destroy a planet is insignificant next to the power of the Force. But with the blast shield down, I can't even see! How am I supposed to fight?",  imageURL:"IMG_0204.jpg", createdAt:"Last Week:",updatedAt:"Last Week:", commentsCount:"5", sectionId:"3")] */
        
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
        cell.courseTitleLabel.text = course.courseName;
        cell.courseDescriptionTextView.text    = course.courseDescription
        //cell.courseImageView.image = course.courseImage
               //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
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
               detailVC.courseNameLabel?.text = course.courseName
              // detailVC.oneCourse = course
                detailVC.title = "Mzinga"
                NSLog("Course name %@", course.courseName)
                 NSLog("Course name %@", course.courseId)


                //}
        
                
           
            
        }

    }
    
}
