//
//  NewItemViewController.swift
//  Mutsu Bucket List
//
//  Created by Richard Dizon on 9/25/16.
//  Copyright © 2016 Team Mutsu. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var descField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPress(_ sender: UIButton) {
        print("\(textField.text)::\(descField.text)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let theDestination = (segue.destination as! MainTableViewController)
        theDestination.Duration2 = ("\(textField.text!)::\(descField.text!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
