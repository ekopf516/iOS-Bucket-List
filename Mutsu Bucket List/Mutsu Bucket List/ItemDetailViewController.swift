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
    
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    var duration: String!
    var row: String! = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        detailField.isHidden = true
        descField.isHidden = true
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
        }
    }
    
    func showEditing(sender: UIBarButtonItem)
    {
        detailField.isHidden = false
        descField.isHidden = false
        button.isHidden = false
    }
    
    @IBAction func editItemButtonPressed(_ sender: UIButton) {
        print("\(detailField.text!)::\(descField.text!)::\(row!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let theDestination = (segue.destination as! MainTableViewController)
        
//        var temp1 : String!
//        temp1 = row!
//        let temp2: String! = temp1!
//        print(temp2)
        
        theDestination.Duration3 = ("\(detailField.text!)::\(descField.text!)::\(row!)")
        print(theDestination.Duration3)
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
