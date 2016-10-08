//
//  ItemDetailViewController.swift
//  Mutsu Bucket List
//
//  Created by Richard Dizon on 10/3/16.
//  Copyright © 2016 Team Mutsu. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
//    @IBOutlet weak var DetailLabelFiller: UILabel!
//    @IBOutlet weak var DescriptionLabelFiller: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
//    @IBOutlet weak var detailLabel: UILabel!
//    
//    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var thing1: UILabel!
    
    @IBOutlet weak var thing2: UILabel!
    
    var duration: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if((duration) != nil) {
            print(duration)
            let textArr : [String] = duration.components(separatedBy: "::")
            let detail : String = textArr[0]
            let desc : String = textArr[1]
            detailLabel.text = detail
            descLabel.text = desc
        }
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
