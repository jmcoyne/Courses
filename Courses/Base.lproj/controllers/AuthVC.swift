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
    var organizations = [Organization]()
    var memberships = [Membership]()
    var user:User?

    
    

    
    
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
        
        let urlLogin = NSURL(string: "http://barbershoplabs.ngrok.com/api/v1/users/sign_in")!
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
                    let successMessage = (self.authCallResults?.valueForKeyPath(AUTH_RESULTS_SUCCESS)) as? String
                    NSLog("Auth Call success = %d", successMessage!)
                    if successMessage == "z3NgdrZjqXngwrumdYi9" {
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
                         self.setUserProperties()
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
    
    func setUserProperties() {
        DataManager.getUserDataFromFileWithSuccess { (data) -> Void in
            // Get #1 app name using SwiftyJSON
            let json = JSON(data: data)
            var id: String? = json["user"]["id"].stringValue
            var userEmail: String? = json["user"]["email"].stringValue
            var signInCount: String? = json["user"]["sign_in_count"].stringValue
            var firstName: String? = json["user"]["first_name"].stringValue
            var lastName: String? = json["user"]["last_name"].stringValue
            var city: String? = json["user"]["city"].stringValue
            var state: String? = json["user"]["state"].stringValue
            var createdAt: String? = json["user"]["created_at"].stringValue
            var updatedAt: String? = json["user"]["updated_at"].stringValue
            var imageURL: String? = json["user"]["image"]["image"]["url"].stringValue
            var xsmallURL: String? = json["user"]["image"]["image"]["xsmall"]["url"].stringValue
            var smallURL: String? = json["user"]["image"]["image"]["small"]["url"].stringValue
            var mediumURL: String? = json["user"]["image"]["image"]["medium"]["url"].stringValue
            var largeURL: String? = json["user"]["image"]["image"]["large"]["url"].stringValue
            
            //1
            if let membershipArray = json["user"]["memberships"].arrayValue {
                //2
                
                
                //3
                for membershipDict in membershipArray {
                    var membershipStatus: String? = membershipDict["status"].stringValue
                    var membershipRole: String? = membershipDict["role"].stringValue
                    var membershipCreatedAt: String? = membershipDict["created_at"].stringValue
                    var membershipUpdatedAt: String? = membershipDict["updated_at"].stringValue
                    var orgName: String? = membershipDict["organization"]["name"].stringValue
                    var orgId: String? = membershipDict["organization"]["id"].stringValue
                    var orgSubdomain: String? = membershipDict["organization"]["subdomain"].stringValue
                    var orgStatus: String? = membershipDict["organization"]["status"].stringValue
                    var orgCreatedAt: String? = membershipDict["organization"]["created_at"].stringValue
                    var orgUpdatedAt: String? = membershipDict["organization"]["updated_at"].stringValue
                    
                    var org = Organization(id: orgId!, name: orgName!, subdomain: orgSubdomain!, status: orgStatus!, createdAt: orgCreatedAt!, updatedAt: orgUpdatedAt!)
                    self.organizations.append(org)
                    let membership = Membership(status: membershipStatus, role: membershipRole, createdAt: membershipCreatedAt, updatedAt: membershipUpdatedAt, organization: org);
                    
                }
                
                //4
                for anOrg in self.organizations {
                    println("Hey! \(anOrg.name)")
                }
                
                

                
            }
            self.user = User(id: id!, email: userEmail!, imageURL: imageURL, xsmallURL: xsmallURL, smallURL: smallURL, mediumURL: mediumURL, largeURL: largeURL, firstName: firstName, lastName: lastName, city: city, state: state, createdAt: createdAt!, updatedAt: updatedAt!, memberships: self.memberships)
            
            self.performSegueWithIdentifier("Organizations", sender: self)
            
            
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "Organizations" {
            
            
             let opvc = segue.destinationViewController as OrganizationsTVC;
            opvc.title = "Organizations"
            opvc.organizations = self.organizations
            NSLog("Seguing to Organization")
            
            
        }
    }


}
