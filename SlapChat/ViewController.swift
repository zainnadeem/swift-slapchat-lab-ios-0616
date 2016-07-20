//
//  ViewController.swift
//  SlapChat
//
//  Created by Zain Nadeem on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let dataStore = DataStore.sharedDataStore
    @IBOutlet weak var itemTextField: UITextField!
    
    
    
    
    @IBAction func saveButton(sender: AnyObject) {
        let context = dataStore.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("Message", inManagedObjectContext: context)
        let newMessage = Message(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
        
        newMessage.setValue("\(itemTextField.text!)", forKey: "content")
        newMessage.setValue(NSDate(), forKey: "createdAt")
        dataStore.saveContext()
        self.dismissViewControllerAnimated(true, completion: nil)
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
