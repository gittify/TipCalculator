//
//  SettingsViewController.swift
//  tippy
//
//  Created by Doshi, Nehal on 3/5/17.
//  Copyright © 2017 Doshi, Nehal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet var secondView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let tipValue = defaults.integer(forKey: "defaultTip")
        segmentedControl.selectedSegmentIndex = tipValue
        
        let iseBlue = UIColor(red: 184 / 255 , green: 197 / 255 , blue: 214 / 255 , alpha: 1.0 )
        let iseLight = UIColor(red:238,green:226,blue:223,alpha: 1.0)
        self.view.backgroundColor = iseBlue
        self.segmentedControl.backgroundColor = iseLight
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let tipValue: Int = segmentedControl.selectedSegmentIndex
        defaults.setValue(tipValue, forKey: "defaultTip")
        
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
