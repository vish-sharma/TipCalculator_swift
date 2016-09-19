//
//  TipCalcViewController.swift
//  TipCalculator_swift
//
//  Created by Omm on 9/11/16.
//  Copyright © 2016 Omm. All rights reserved.
//

import UIKit

class TipCalcViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var amntTextField: UITextField!
    @IBOutlet weak var rateSegmentBar: UISegmentedControl!
    @IBOutlet weak var tipCalculationView: UIView!
    @IBOutlet weak var tipPercentageAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
  
    @IBOutlet weak var amountLabelTopConstraint: NSLayoutConstraint!
    
    var amount = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.amountLabelTopConstraint.constant = 200.0
        
        let settingsButton = UIBarButtonItem(
            title: "Settings",
            style: .Plain,
            target: self,
            action: "changeSettings:"
        )
        
        self.navigationItem.rightBarButtonItem = settingsButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeSettings(sender: UIBarButtonItem) {
        
    }
    
    func tipCalculation(textVal: String, percent: String) {
        
        let percentVal = (Float(percent)!/100)*Float(textVal)!
        print(percentVal)
        
        self.tipPercentageAmount.text = String(format: "%.2f",Float(percentVal))

        
        let total = Float(textVal)!+percentVal
        self.totalAmount.text = String(format: "%.2f",Float(total))
        
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        self.amount = self.amntTextField.text!
        self.amount = (self.amount as NSString).stringByReplacingCharactersInRange(range, withString: string)
        if(self.amount.characters.count > 0) {
            self.rateSegmentBar.hidden = false
            self.tipCalculationView.hidden = false
            self.amountLabelTopConstraint.constant = 70.0
        } else{
            self.rateSegmentBar.hidden = true
            self.tipCalculationView.hidden = true
            self.amountLabelTopConstraint.constant = 200.0
        }
        let title: String = self.rateSegmentBar.titleForSegmentAtIndex(self.rateSegmentBar.selectedSegmentIndex)!
        let index: String.Index = title.startIndex.advancedBy(2)
        let tempTitle:String = title.substringToIndex(index)
        [self .tipCalculation(self.amount, percent:tempTitle)]
        return true
        
    }

    @IBAction func rateSegmentValueChange(sender: AnyObject) {
        
        let title: String = self.rateSegmentBar.titleForSegmentAtIndex(self.rateSegmentBar.selectedSegmentIndex)!
        let index: String.Index = title.startIndex.advancedBy(2)
        let tempTitle:String = title.substringToIndex(index)
        [self .tipCalculation(self.amount, percent:tempTitle)]
    }

}
