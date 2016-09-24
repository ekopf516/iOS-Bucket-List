//
//  ViewController.swift
//  lynda-FirstProject
//
//  Created by Richard Dizon on 9/24/16.
//  Copyright © 2016 Richard Dizon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func didTapButton(_ sender: AnyObject) {
        // Use "var" for changes, use "let" if static
        let name = myTextField.text!
        myLabel.text = "Hi \(name)!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

