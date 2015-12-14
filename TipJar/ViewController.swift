//
//  ViewController.swift
//  TipJar
//
//  Created by Michael Montella on 8/11/15.
//  Copyright © 2015 Michael Montella. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
// MARK: IBOutlets
    @IBOutlet weak var qualityPicker: UIPickerView!
    
    @IBOutlet weak var subtotal: UITextField!
    
    @IBOutlet weak var myLabel2: UIButton!
    @IBOutlet weak var myLabel3: UIButton!
    @IBOutlet weak var myLabel4: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!

    var tip: Double = 10
    
    let formatter = NSNumberFormatter()
    
    let alertController = UIAlertController(title: "Invalid Number", message: "Please input a valid number", preferredStyle: UIAlertControllerStyle.Alert)
    
    // First Button
    @IBAction func calculateTip(sender: AnyObject) {
        
        formatter.numberStyle = .CurrencyStyle

        if subtotal.text != "" {
            if let costDouble = Double(subtotal.text!) {
                switch quality {
                case "Poor":
                    tip = costDouble * 0.08
                case "Okay":
                    tip = costDouble * 0.10
                case "Good":
                    tip = costDouble * 0.15
                case "Great":
                    tip = costDouble * 0.18
                default:
                    tip = costDouble * 0.08
                }
                
                tipAmount.text = "Tip: " + formatter.stringFromNumber(tip)!
                resultLabel.text = "Total: " + formatter.stringFromNumber(tip + Double(subtotal.text!)!)!

            } else {
                let alertController = UIAlertController(title: "Invalid Number", message: "Please input a valid number", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }

        } else {
            resultLabel.text = "Please enter a number"
        }
    }

    // Second Button
    @IBAction func calculateTip2(sender: AnyObject) {
        
        formatter.numberStyle = .CurrencyStyle
        
        if subtotal.text != "" {
            if let costDouble = Double(subtotal.text!) {
                switch quality {
                case "Poor":
                    tip = costDouble * 0.10
                case "Okay":
                    tip = costDouble * 0.15
                case "Good":
                    tip = costDouble * 0.18
                case "Great":
                    tip = costDouble * 0.20
                default:
                    tip = costDouble * 0.10
                }
                
                tipAmount.text = "Tip: " + formatter.stringFromNumber(tip)!
                resultLabel.text = "Total: " + formatter.stringFromNumber(tip + Double(subtotal.text!)!)!

            } else {
                let alertController = UIAlertController(title: "Invalid Number", message: "Please input a valid number", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        } else {
            resultLabel.text = "Please enter a number"
        }
    }
    
    // Third Button
    @IBAction func calculateTip3(sender: AnyObject) {
        
        formatter.numberStyle = .CurrencyStyle
        
        // Using switch statement
        if subtotal.text != "" {
            if let costDouble = Double(subtotal.text!) {
                switch quality {
                case "Poor":
                    tip = costDouble * 0.15
                case "Okay":
                    tip = costDouble * 0.18
                case "Good":
                    tip = costDouble * 0.20
                case "Great":
                    tip = costDouble * 0.25
                default:
                    tip = costDouble * 0.15
                }
                
                tipAmount.text = "Tip: " + formatter.stringFromNumber(tip)!
                resultLabel.text = "Total: " + formatter.stringFromNumber(tip + Double(subtotal.text!)!)!
                
            } else {
                let alertController = UIAlertController(title: "Invalid Number", message: "Please input a valid number", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        } else {
            resultLabel.text = "Please enter a number"
        }
        
        
        
        // Using if and else if statements
        /*
        if subtotal.text != "" {    // Checks if text field is not blank
            if quality == "Poor" {
                tip = Double(subtotal.text!)! * 0.15
            } else if quality == "Okay" {
                tip = Double(subtotal.text!)! * 0.18
            } else if quality == "Good" {
                tip = Double(subtotal.text!)! * 0.20
            } else if quality == "Great" {
                tip = Double(subtotal.text!)! * 0.25
            } else {
                tip = Double(subtotal.text!)! * 0.15
            }
        } else {    // Runs this if text field is blank
            resultLabel.text = "Please enter a number"
        }
*/
        

    }
    
    
    var quality: String = ""
    
    // Quality of service option
    let dataPicker = ["Poor", "Okay", "Good", "Great"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set border of text to white
        subtotal.layer.borderColor = UIColor.whiteColor().CGColor
        subtotal.layer.borderWidth = 1
        subtotal.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        subtotal.layer.cornerRadius = 8
        
        qualityPicker.layer.cornerRadius = 8
        
        self.qualityPicker.dataSource = self
        self.qualityPicker.delegate = self
        
        qualityPicker.layer.borderWidth = 1
        qualityPicker.layer.borderColor = UIColor.whiteColor().CGColor
        qualityPicker.layer.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0).CGColor
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: - Delegate and Data Source
    // MARK: - Delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataPicker.count
    }
    
    // MARK: - Data Source
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataPicker[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        quality = dataPicker[row]
        
        // Sets button title based on quality picker
        switch quality {
        case "Poor":
            myLabel2.setTitle("8%", forState: .Normal)
            myLabel3.setTitle("10%", forState: .Normal)
            myLabel4.setTitle("15%", forState: .Normal)
        case "Okay":
            myLabel2.setTitle("10%", forState: .Normal)
            myLabel3.setTitle("15%", forState: .Normal)
            myLabel4.setTitle("18%", forState: .Normal)
        case "Good":
            myLabel2.setTitle("15%", forState: .Normal)
            myLabel3.setTitle("18%", forState: .Normal)
            myLabel4.setTitle("20%", forState: .Normal)
        case "Great":
            myLabel2.setTitle("18%", forState: .Normal)
            myLabel3.setTitle("20%", forState: .Normal)
            myLabel4.setTitle("25%", forState: .Normal)
        default:
            myLabel2.setTitle("10%", forState: .Normal)
            
        }
        
        
        /*  if statement
        // Sets titles for each button based on quality picked
        if quality == "Poor" {
            myLabel2.setTitle("8%", forState: .Normal)
            myLabel3.setTitle("10%", forState: .Normal)
            myLabel4.setTitle("15%", forState: .Normal)
        } else if quality == "Okay" {
            myLabel2.setTitle("10%", forState: .Normal)
            myLabel3.setTitle("15%", forState: .Normal)
            myLabel4.setTitle("18%", forState: .Normal)
        } else if quality == "Good" {
            myLabel2.setTitle("15%", forState: .Normal)
            myLabel3.setTitle("18%", forState: .Normal)
            myLabel4.setTitle("20%", forState: .Normal)
        } else if quality == "Great" {
            myLabel2.setTitle("18%", forState: .Normal)
            myLabel3.setTitle("20%", forState: .Normal)
            myLabel4.setTitle("25%", forState: .Normal)
        }
        */
        
        
    }
    
    // Sets font to Helvetica Neue and color to White
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = dataPicker[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 15.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }

}

