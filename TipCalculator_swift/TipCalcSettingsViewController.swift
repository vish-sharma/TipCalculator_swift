//
//  TipCalcSettingsViewController.swift
//  TipCalculator_swift
//
//  Created by Omm on 9/11/16.
//  Copyright © 2016 Omm. All rights reserved.
//

import UIKit

protocol RateSegmentValueDelegate {
    func rateSettingsValueChange(index: Int)
}

public class TipCalcSettingsViewController: UIViewController {

    @IBOutlet weak var settingRateSegmentBar: UISegmentedControl!
    var rateIndex: Int = 0
    var delegate: RateSegmentValueDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.settingRateSegmentBar.selectedSegmentIndex = self.rateIndex
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func rateValueChange(sender: AnyObject) {
        delegate?.rateSettingsValueChange(self.settingRateSegmentBar.selectedSegmentIndex)
        self.navigationController?.popViewControllerAnimated(true)
    }

}
