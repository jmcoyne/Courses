//
//  DetailViewController.swift
//  Courses
//
//  Created by Joan Coyne on 12/10/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    
    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var commentsUserName: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    var userDictionary = ["1":"John Doe","2":"Suzy Q"]
    
    var comments = [Comment]()
    var oneCourse: OneCourse?
    var didInitialLayout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get Course data
        
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
            var mediaURL: String?  = json["course"]["image"]["image"]["url"].stringValue
            var videoURL: String?  = json["course"]["media_url"].stringValue
            var xsmallURL: String? = json["course"]["panda_video_url"].stringValue
            var smallURL: String?  = json["course"]["image"]["image"]["small"]["url"].stringValue
            var mediumURL: String? = json["course"]["image"]["image"]["medium"]["url"].stringValue
            var largeURL: String?  = json["course"]["image"]["image"]["large"]["url"].stringValue
            var sectionId: String?  = json["course"]["section_id"].stringValue
            
            if let commentArray = json["course"]["comments"].arrayValue {
                
                for commentDict in commentArray {
                    var commentId: String? = commentDict["id"].stringValue
                    var commentUserId: String? = commentDict["user_id"].stringValue
                    var commentBody: String? = commentDict["body"].stringValue
                    var commentCreatedAt: String? = commentDict["created_at"].stringValue
                    var commentUpdatedAt: String? = commentDict["updated_at"].stringValue
                    
                    var comment = Comment(id: commentId!, userId: commentUserId!, body: commentBody, createdAt: commentCreatedAt, updatedAt: commentUpdatedAt)
                    self.comments.append(comment)
                    
                }
                

            
                self.oneCourse = OneCourse(id: courseId!, name: courseName!, sectionId: sectionId!, description: courseDescription, mediaURL: mediaURL!, videoURL: videoURL, courseImageURL: imageURL,  courseXsmallURL: xsmallURL, courseSmallURL: smallURL, courseMediumURL: mediumURL, courseLargeURL: largeURL, courseCreatedAt: createdAt!, courseUpdatedAt: updatedAt!, commentsCount: commentCount, comments:self.comments)
                
            }
            
            
        
        

        //Set up table subview

       

        self.configureView()

        // Do any additional setup after loading the view.
    }
    }
    

    func configureView() {
        if let course = oneCourse? {
        //courseImageView.image. = oneCourse?.courseImageURL
            courseNameLabel?.text = course.name
            sectionLabel?.text = course.description
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Embedded AVplayer
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLayoutSubviews() {
        if !self.didInitialLayout {
            self.didInitialLayout = true
             self.configureView()
            self.setUpChild()
        }
    }
    func setUpChild() {
        let url = NSBundle.mainBundle().URLForResource("IMG_1219", withExtension:"MOV")
         NSLog("here's my path \(url)")
        let asset = AVURLAsset(URL:url, options:nil)
        let item = AVPlayerItem(asset:asset)
        let player = AVPlayer(playerItem:item)
        
        let av = AVPlayerViewController()
        av.player = player
        av.view.frame = CGRectMake(10,10,300,200)
        av.view.hidden = true // looks nicer if we don't show until ready
        self.addChildViewController(av)
        self.view.addSubview(av.view)
        av.didMoveToParentViewController(self)
        av.addObserver(self, forKeyPath: "readyForDisplay", options: nil, context: nil)
        
        return; // just proving you can swap out the player
    }
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<()>) {
        if keyPath == "readyForDisplay" {
            dispatch_async(dispatch_get_main_queue(), {
                self.finishConstructingInterface()
            })
        }
    }
    func finishConstructingInterface () {
        let vc = self.childViewControllers[0] as AVPlayerViewController
        if !vc.readyForDisplay {
            return
        }
        println("finishing")
        vc.removeObserver(self, forKeyPath:"readyForDisplay")
        vc.view.hidden = false
    }
    //mark: - Table View Protocols
    
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Comment Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.detailTextLabel?.text =  self.comments[indexPath.row].body
    
        cell.textLabel?.text = self.userDictionary[self.comments[indexPath.row].userId]
    
        // cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 44
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("SELECTED INDEX /(indexPath.row)")
    }
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
           return self.comments.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return "Comments"
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
