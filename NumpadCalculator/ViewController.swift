//
//  ViewController.swift
//  NumpadCalculator
//
//  Created by Mac on 22/4/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var numberLabel: UILabel!
    
    var previousNumber: Double = 0
    var lastNumber: Double = 0
    var operation = 0
    var numberOperation = false
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func numberPressing(_ sender: UIButton) {
        if numberOperation == true {
            numberLabel.text = String(sender.tag-1)
            lastNumber = Double(numberLabel.text!)!
            numberOperation = false
        }
        else {
            if let text = numberLabel.text {
                numberLabel.text = numberLabel.text! + String(sender.tag-1)
                lastNumber = Double(numberLabel.text!)! }
        }
    }
    
    @IBAction func operationPressing(_ sender: UIButton) {
    if numberLabel.text != " " && sender.tag != 17 && sender.tag != 18 {
        previousNumber =  Double(numberLabel.text!)!
        if sender.tag == 11 {
            numberLabel.text =  "+"
        }
        if sender.tag == 12 {
            numberLabel.text = "-"
        }
        if sender.tag == 13 {
            numberLabel.text = "*"
        }
        if sender.tag == 14 {
            numberLabel.text = "/"
        }
        if sender.tag == 15 {
            numberLabel.text = "%"
        }
        operation = sender.tag
        numberOperation = true
        }
    else if sender.tag == 16 {
        numberLabel.text = String(Double(numberLabel.text!)! * (-1))
        }
    else if sender.tag == 17 {
        if operation == 11 {
            numberLabel.text = String(previousNumber + lastNumber)
        }
        if operation == 12 {
            numberLabel.text = String(previousNumber - lastNumber)
        }
        if operation == 13 {
            numberLabel.text = String(previousNumber * lastNumber)
        }
        if operation == 14 {
            numberLabel.text = String(previousNumber / lastNumber)
        }
        if operation == 15 {
            let percent:Double =  (previousNumber / lastNumber)
            numberLabel.text = String(percent.truncatingRemainder(dividingBy: Double(percent)))
        }
        }
    else if sender.tag == 18 {
        numberLabel.text = " "
        previousNumber = 0
        lastNumber = 0
        operation = 0
        }
    }
    
    
}

