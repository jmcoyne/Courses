//
//  AuthVC.swift
//  Courses
//
//  Created by Joan Coyne on 12/3/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

import UIKit

@objc(AuthVC) class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userDidAuthenticate = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var authCallResults:NSDictionary?
    var defaults: NSUserDefaults  = NSUserDefaults.standardUserDefaults()

    
    

    
    
    lazy var defaultConfigObject: NSURLSessionConfiguration = {
        NSURLSessionConfiguration.defaultSessionConfiguration()
        }()
    lazy var defaultSession: NSURLSession = {
        return NSURLSession(configuration: self.defaultConfigObject)
        }()
    lazy var userDidAuthenticate:Bool = false

    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func touchLogin(sender: AnyObject) {
        self.httpPostWithCustomDelegate()
    }

    func httpPostWithCustomDelegate() {
              // retries when connection has been terminated, avoids request if battery islowor wifi performance is not good
        defaultConfigObject.discretionary = true
        
        var defaultSession: NSURLSession = {
            NSURLSession(configuration: self.defaultConfigObject)
            }()
        var emailText = self.email.text
        var passwordText = self.password.text
        
        let urlLogin = NSURL(string: "https://test.lifeplot.com/api/v1/users/sign_in")!
        var req = NSMutableURLRequest(URL: urlLogin)
        
        
        
        var reqParams:NSString = "email=\(emailText)&password=\(passwordText)&submit=true"
        NSLog("PostData: %@",reqParams)
        req.HTTPMethod = "post"
        var reqParamsData:NSData = reqParams.dataUsingEncoding(NSASCIIStringEncoding)!
        req.HTTPBody = reqParamsData
        
           NSLog("Sending request for \(req.URL)")
        var task = self.defaultSession.dataTaskWithRequest(req) {
            (data, response, error) in
            var error: NSError?
            if error == nil {
                let httpResponse = response as NSHTTPURLResponse
                    NSLog("Received HTTP \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    let body = NSString(data: data, encoding: NSUTF8StringEncoding)
                    NSLog("Response from \(req.URL): \(body)")
                    self.authCallResults = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: &error) as? NSDictionary
                    NSLog("Auth Call results = %@", self.authCallResults!);
                    let successMessage = (self.authCallResults?.valueForKeyPath(AUTH_RESULTS_SUCCESS)) as? Int
                    NSLog("Auth Call success = %d", successMessage!)
                    if successMessage == 1 {
                        NSLog("We got in!")
                        self.userDidAuthenticate   = true
                         let userEmail = (self.authCallResults?.valueForKeyPath(AUTH_RESULTS_EMAIL)) as? String
                        NSLog("My email is %@", userEmail!)
                        let userAuthToken = (self.authCallResults?.valueForKeyPath(AUTH_RESULTS_AUTH_TOKEN)) as? String
                          NSLog("My authToken is %@", userAuthToken!)
                                               self.defaults.setObject(userEmail, forKey: "email")
                         self.defaults.setObject(userAuthToken, forKey: "authToken")
                        
                         self.defaults.synchronize()
                        //TODO Get user info, specifically, check for organizations
                        self.performSegueWithIdentifier("Organizations", sender: self)
                    }
                    else {
                         self.userDidAuthenticate   = false;
                    }
                    
                   // NSLog("Response:%@ %@\n", response, error);
                } else {
                    NSLog("Don't know how to handle response: \(response)")
                }
            } else {
                NSLog("Error: \(error)")
            }
        }
        
        task.resume()
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "Organizations" {
            
            NSLog("Seguing to Organization")
             let opvc = segue.destinationViewController as OrganizationsTVC;
            opvc.title = "Organizations"
            
            
            
        }
    }


}
