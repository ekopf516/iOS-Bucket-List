//
//  ViewController.swift
//  lynda-FirstProject
//
//  Created by Richard Dizon on 9/24/16.
//  Copyright © 2016 Richard Dizon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // myTextField.delegate = self
    }
    @IBAction func didTapButton(_ sender: AnyObject) {
        // Use "var" for changes, use "let" if static
        let name = myTextField.text!
        myLabel.text = "Hi \(name)!"
        myTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

