//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var localArray: [Message] = []
    let dataStore = DataStore.sharedDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataStore.fetchData()
        localArray = dataStore.messages
        if localArray == []{
        generateTestData()
        }
    
        print("++++++++++++++++++++++++++\(localArray)")
        
        
//        let newMessage = Message(entity: entityDescription, insertIntoManagedObjectContext: NSManagedObjectContext)
       
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        dataStore.fetchData()
        localArray = dataStore.messages
        tableView.reloadData()
       
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localArray.count
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = localArray[indexPath.row].content
        
        return cell
    }
    
    
    
    
    func generateTestData(){
      
        let context = dataStore.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Message", inManagedObjectContext: context)
        let newMessage = Message(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
        
        newMessage.setValue("First", forKey: "content")
        newMessage.setValue(NSDate(), forKey: "createdAt")
        
        
        dataStore.saveContext()
        dataStore.fetchData()
    }
    
    
}
