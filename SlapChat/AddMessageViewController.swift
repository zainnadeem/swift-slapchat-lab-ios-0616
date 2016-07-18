//
//  ViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    @IBOutlet weak var addMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveMessageButtonTapped(sender: AnyObject) {
        
        let store = DataStore()
        let newMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: store.managedObjectContext) as! Message
        newMessage.content = addMessageTextField.text
        newMessage.createdAt = NSDate()
        store.saveContext()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

