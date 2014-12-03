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

}
