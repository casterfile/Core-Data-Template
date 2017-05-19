//
//  ViewController.swift
//  Core Data Template
//
//  Created by Anon on 19/05/2017.
//  Copyright © 2017 Anthony Castor. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: DataBaseController.getContext()) as! Student
        student.firstName = "Anthony"
        student.lastName = "Castor"
        student.age = 26
        
        DataBaseController.saveContext()
        
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            
            let searchResult = try DataBaseController.getContext().fetch(fetchRequest)
            print("number of results:\(searchResult.count)")
            
            for result in searchResult as [Student]{
                print("\(result.firstName!) \(result.lastName!) is \(result.age)")
            }
        }
        catch{
            print("Error: \(error)")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

