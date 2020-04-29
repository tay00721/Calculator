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
                numberLabel.text = numberLabel.text! + String(sender.tag-1)
            if let numberText = numberLabel.text, let number = Double(numberText){
                 lastNumber =  number }
        }
        }
    
    
    @IBAction func clearingPressing(_ sender: UIButton) {
        if sender.tag == 18 {
            numberLabel.text = " "
            previousNumber = 0
            lastNumber = 0
            operation = 0
            numberOperation = false
    }
    
}
    @IBAction func operationPressing(_ sender: UIButton) {

        if numberLabel.text != nil && sender.tag != 17 && sender.tag != 20 {
        if let numberTextV2 = numberLabel.text, let numberV2 = Double(numberTextV2){
            previousNumber =  numberV2 }
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
     if sender.tag == 16 {
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
       else if operation == 15 {
            numberLabel.text = String(previousNumber * lastNumber / 100)
        }
        }
       else if sender.tag == 20 {
            numberLabel.text = numberLabel.text! + "."
        }
    }
    
    
}

