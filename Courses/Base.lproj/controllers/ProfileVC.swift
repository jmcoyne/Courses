//
//  ProfileVC.swift
//  Courses
//
//  Created by Joan Coyne on 1/20/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import UIKit

@objc(ProfileVC) class ProfileVC: UIViewController {

  
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfile()
       
        
        // MARK: - Properties
      //  var user: User? {
   //         didSet {
   //             configureProfile()
   //         }
   //     }

        // Do any additional setup after loading the view.
    }
    // MARK: - Utility methods
    private func configureProfile() {
        //courseImageView.image = oneCourse?.courseImage
        let userFirstName = defaults.stringForKey("firstName")
        let userLastName = defaults.stringForKey("lastName")
        let userEmail  = defaults.stringForKey("email")
       let userName = userFirstName! + " " + userLastName!
        
        userNameLabel?.text = userName
        
        userEmailLabel?.text = userEmail
      
  //      NSlog("here is my user \(user?.email)")
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
