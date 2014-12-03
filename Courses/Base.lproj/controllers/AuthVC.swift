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
    lazy var defaultConfigObject: NSURLSessionConfiguration = {
        NSURLSessionConfiguration.defaultSessionConfiguration()
        }()
    lazy var defaultSession: NSURLSession = {
        NSURLSession(configuration: self.defaultConfigObject)
        }()
    lazy var userDidAuthenticate:Bool = false

    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func touchLogin(sender: AnyObject) {
        self.httpPostWithCustomDelegate()
    }

    func httpPostWithCustomDelegate() {
       var defaultConfigObject: NSURLSessionConfiguration = {
            NSURLSessionConfiguration.defaultSessionConfiguration()
            }()
        var defaultSession: NSURLSession = {
            NSURLSession(configuration: defaultConfigObject)
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
        request(req)
    }
    func request(request: NSURLRequest) {
        appendOutput("Sending request for \(request.URL)")
        var task = self.defaultSession.dataTaskWithRequest(request) {
            (data, response, error) in
            
            if error == nil {
                if let httpResponse = response as? NSHTTPURLResponse {
                    self.appendOutput("Received HTTP \(httpResponse.statusCode)")
                    let body = NSString(data: data, encoding: NSUTF8StringEncoding)
                    self.appendOutput("Response from \(request.URL): \(body)")
                } else {
                    self.appendOutput("Don't know how to handle response: \(response)")
                }
            } else {
                self.appendOutput("Error: \(error)")
            }
        }
        task.resume()
    }
    
    func appendOutput(string: String) {
        println(string)
        NSOperationQueue.mainQueue().addOperationWithBlock {
            var text: String = self.outputTextView.text
            text = text.stringByAppendingString(string)
            text = text.stringByAppendingString("\n\n")
            self.outputTextView.text = text
        }
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
