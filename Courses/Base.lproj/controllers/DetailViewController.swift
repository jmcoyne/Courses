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

class DetailViewController: UIViewController {
    
 
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var courseSectionLabel: UILabel!
    @IBOutlet weak var cachedVotesUpButton: UIButton!
  
    @IBOutlet weak var cachedVotesDownButton: UIButton!
    var oneCourse: OneCourse?
    var didInitialLayout = false
    
    
    
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
            var mediaURL: String?  = json["course"]["image"]["image"]["url"].stringValue
            var videoURL: String?  = json["course"]["media_url"].stringValue
            var xsmallURL: String? = json["course"]["panda_video_url"].stringValue
            var smallURL: String?  = json["course"]["image"]["image"]["small"]["url"].stringValue
            var mediumURL: String? = json["course"]["image"]["image"]["medium"]["url"].stringValue
            var largeURL: String?  = json["course"]["image"]["image"]["large"]["url"].stringValue
            var sectionId: String?  = json["course"]["section_id"].stringValue
            var cachedVotesUp: String? = json["course"]["cached_votes_up"].stringValue
            var cachedVotesDown: String? = json["course"]["cached_votes_down"].stringValue
            
            

            
            self.oneCourse = OneCourse(id: courseId!, name: courseName!, sectionId: sectionId!, description: courseDescription, mediaURL: mediaURL!, videoURL: videoURL, courseImageURL: imageURL,  courseXsmallURL: xsmallURL, courseSmallURL: smallURL, courseMediumURL: mediumURL, courseLargeURL: largeURL, courseCreatedAt: createdAt!, courseUpdatedAt: updatedAt!, commentsCount: commentCount, cachedVotesUp: cachedVotesUp, cachedVotesDown: cachedVotesDown)
                
            }
            
            
        
        

        
       // makeLayout()
        self.configureView()

        // Do any additional setup after loading the view.
    }
    
    

    private func configureView() {
        if let course = oneCourse? {
        //courseImageView.image. = oneCourse?.courseImageURL
       courseNameLabel?.text = course.name
       courseSectionLabel?.text = course.description
           
        cachedVotesUpButton.setTitle(course.cachedVotesUp, forState: UIControlState.Normal)
        cachedVotesDownButton.setTitle(course.cachedVotesDown, forState: UIControlState.Normal)
            

            course.cachedVotesUp
            
            
           //courseNameLabel?.text = "Hey there!"
          //  sectionLabel?.text = "Ho There!"
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
        av.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addChildViewController(av)
        self.view.addSubview(av.view)
        av.didMoveToParentViewController(self)
        
               
        av.addObserver(self, forKeyPath: "readyForDisplay", options: nil, context: nil)
         let viewsDictionary = ["view1":av.view]
        //view1
        let view1_constraint_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1(300)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view1_constraint_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1(200)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        av.view.addConstraints(view1_constraint_H)
        av.view.addConstraints(view1_constraint_V)
        
        //position constraints
        
        //views
        let view_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[view1]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let view_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-36-[view1]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)

        
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
        let vcArray  = self.childViewControllers
        var vc = AVPlayerViewController()
        for child in vcArray {
            if let  thisChild = child as? AVPlayerViewController{
                vc =  thisChild
            }
        }
        if !vc.readyForDisplay {
            return
        }
        println("finishing")
        vc.removeObserver(self, forKeyPath:"readyForDisplay")
        vc.view.hidden = false
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
