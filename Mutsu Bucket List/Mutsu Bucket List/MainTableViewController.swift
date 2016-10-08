//
//  MainTableViewController.swift
//  Mutsu Bucket List
//
//  Created by Richard Dizon on 9/25/16.
//  Copyright © 2016 Team Mutsu. All rights reserved.
//

import UIKit
import Foundation

class MainTableViewController: UITableViewController {

    var bucketList = ["Streak the Lawn::Feel the cool, gentle breeze between your thighs down the purple shadows of the Lawn", "Attend Rotunda Sing::Annual UPC event featuring many of UVA's acapella groups", "See the River on the Lawn::Sit upside down at the highest steps of the Rotunda and let your imagination run free", "Go to UPC's Springfest::Annual UPC event held on the Lawn featuring local and national artists", "See the Purple Shadows on TJ's Birthday::On the sunrise of Thomas Jefferson's birthday, the Purple Shadows lay a wreath at the base of his statue on the lawn. Come watch.", "Fill in the Blank::Make your own entry!"]
    var Duration2: String!
    var Duration3: String!
    var touchedRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        if((Duration2) != nil) {
            bucketList.append(Duration2!)
        }
        
        if((Duration3) != nil) {
            print(Duration3)
            let textArr : [String] = Duration3.components(separatedBy: "::")
            print(textArr)
            
            let index: Int! = Int(textArr[2])
            
            bucketList[index] = "\(textArr[0])::\(textArr[1])"
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(gesture:)))
        recognizer.direction = UISwipeGestureRecognizerDirection.right
        self.tableView.addGestureRecognizer(recognizer)
        
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipe(gesture:)))
        leftRecognizer.direction = UISwipeGestureRecognizerDirection.left
        self.tableView.addGestureRecognizer(leftRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tableTap(gesture:)))
        self.tableView.addGestureRecognizer(tapRecognizer)
    }
    
    func didSwipe(gesture: UISwipeGestureRecognizer) {
        // Recognizes right swipe and checks box
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            if gesture.state == UIGestureRecognizerState.ended {
                let swipeLocation = gesture.location(in: self.tableView)
                if let swipedIndexPath = tableView.indexPathForRow(at: swipeLocation) {
                    if let swipedCell = self.tableView.cellForRow(at: swipedIndexPath) {
                        if swipedCell.accessoryType != UITableViewCellAccessoryType.checkmark {
                            swipedCell.accessoryType = UITableViewCellAccessoryType.checkmark
                        }
                    }
                }
            }
            else {
            }
            
            print("Did swipe")
        }
    }
    
    func leftSwipe(gesture: UISwipeGestureRecognizer) {
        // Recognizes left swipe and un-checks box
        if gesture.direction == UISwipeGestureRecognizerDirection.left {
            if gesture.state == UIGestureRecognizerState.ended {
                let swipeLocation = gesture.location(in: self.tableView)
                if let swipedIndexPath = tableView.indexPathForRow(at: swipeLocation) {
                    if let swipedCell = self.tableView.cellForRow(at: swipedIndexPath) {
                        if swipedCell.accessoryType == UITableViewCellAccessoryType.checkmark {
                            swipedCell.accessoryType = UITableViewCellAccessoryType.none
                        }
                    }
                }
            }
            print("Left Swipe")
        }
    }
    
    func tableTap(gesture: UITapGestureRecognizer) {
        let touchLocation = gesture.location(in: self.tableView)
        if let touchIndexPath = tableView.indexPathForRow(at: touchLocation) {
            if let touchedCell = self.tableView.cellForRow(at: touchIndexPath) {
                touchedRow = (tableView.indexPath(for: touchedCell)?.row)!
                
                let txt:String? = touchedCell.textLabel?.text!
                print("\(txt!)" + " is row " + "\(touchedRow!)")
                
                var done: String = "notDone"
                
                if touchedCell.accessoryType == UITableViewCellAccessoryType.checkmark {
                    done = "done"
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let destination = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
                
                destination.duration = bucketList[touchedRow]+"::\(String(touchedRow))::\(done)"
                navigationController?.pushViewController(destination, animated: true)
                
//                performSegue(withIdentifier: "ItemDetailViewController", sender: nil)
                
//                let viewControllerB = ItemDetailViewController()
//                viewControllerB.duration = bucketList[touchedRow]
//                navigationController?.pushViewController(viewControllerB, animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("\(touchedRow)" + " happened")
        
        if segue.identifier == "ItemDetailViewController"{
            if segue.destination is ItemDetailViewController{
                let secondViewController = segue.destination as! ItemDetailViewController
                secondViewController.duration = bucketList[touchedRow]
            }
        }
    }
    
    /*
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        if buttonSegue == unwindSegue {
            print("amazing")
        }
    }
     */

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bucketList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = bucketList[indexPath.row].components(separatedBy: "::")[0]
        
        return cell
    }

    /***************
    Keep the following comments in case we need them for the full, final project"
    ***************/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
