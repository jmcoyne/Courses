//
//  SplitViewController.swift
//
//
//  Created by Joan Coyne on 12/10/14.
//
import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        delegate = self
        
        
    }
    
    func splitViewController(splitController:
        UISplitViewController,
        collapseSecondaryViewController secondaryViewController:
        UIViewController,
        ontoPrimaryViewController primaryViewController:
        UIViewController) -> Bool {
            return true
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
//


