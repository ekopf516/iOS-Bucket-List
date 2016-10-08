//
//  ItemDetailViewController.swift
//  Mutsu Bucket List
//
//  Created by Richard Dizon on 10/3/16.
//  Copyright © 2016 Team Mutsu. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    @IBOutlet weak var doneSwitch: UISwitch!
    
    @IBOutlet weak var button: UIButton!
    
    var duration: String!
    var row: String! = "0"
    var done: String!
    var touched: UITableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailField.isHidden = true
        descField.isHidden = true
        doneSwitch.isHidden = true
        completedLabel.isHidden = true
        button.isHidden = true
        
        let rightButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showEditing))
        self.navigationItem.rightBarButtonItem = rightButton

        // Do any additional setup after loading the view.
        if((duration) != nil) {
            print(duration)
            let textArr : [String] = duration.components(separatedBy: "::")
            detailLabel.text = textArr[0]
            descLabel.text = textArr[1]
            row = textArr[2]
            done = textArr[3]
        }
    }
    
    func showEditing(sender: UIBarButtonItem)
    {
        detailField.isHidden = false
        descField.isHidden = false
        completedLabel.isHidden = false
        button.isHidden = false
        
        if(done == "done") {
            doneSwitch.isOn = true
        }
        else {
            doneSwitch.isOn = false
        }
        
        doneSwitch.isHidden = false
    }
    
    @IBAction func editItemButtonPressed(_ sender: UIButton) {
        print("\(detailField.text!)::\(descField.text!)::\(row!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let theDestination = (segue.destination as! MainTableViewController)
        
        if (doneSwitch.isOn) {
            done = "done"
        }
        else {
            done = "notDone"
        }
        
        theDestination.Duration3 = ("\(detailField.text!)::\(descField.text!)::\(row!)::\(done!)")
        theDestination.lastTouch = touched!
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
