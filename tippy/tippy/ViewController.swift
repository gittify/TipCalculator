//
//  ViewController.swift
//  tippy
//
//  Created by Doshi, Nehal on 3/3/17.
//  Copyright © 2017 Doshi, Nehal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    //static var tempBill=""
    //static var clearFlag = false
    
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
        let defaults = UserDefaults.standard
        let tipValue = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = tipValue
       
            }
    
    func update(){
        
        
        let defaults = UserDefaults.standard
        let prevBill = defaults.string(forKey: "prevBill")
        let prevTS = defaults.string(forKey: "tsstamp")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.A"
        let today = dateFormatter.string(from: NSDate() as Date)
        if !(prevTS?.isEmpty ?? true)   {
            let myDate = dateFormatter.date(from: prevTS!)
            let forDate = dateFormatter.date(from: today)
            
            let diff = Calendar.current.dateComponents([.minute], from: myDate!, to: forDate!).minute ?? 0
            print("printinggggggg")
            print(diff)
            if diff > 1 {
              //  ViewController.tempBill=""
               // ViewController.clearFlag=true
                billField.text=""
            }
            else {
                
              //  ViewController.tempBill = prevBill!
                billField.text=prevBill
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
  
    @IBAction func calculateTip(_ sender: Any) {
    
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
        
        let defaults = UserDefaults.standard
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.A"
        let now = dateFormatter.string(from: NSDate() as Date)
        defaults.setValue(bill, forKey: "prevBill")
        defaults.setValue(now, forKey: "tsstamp")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view will appear")
        let defaults = UserDefaults.standard
        let tipValue = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = tipValue
        calculateTip(self.tipControl)
        
        
        self.view.backgroundColor = Style.iseBlue
        self.tipControl.backgroundColor = UIColor.white
        self.billField.becomeFirstResponder()
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.billField.alpha = 0
            self.tipControl.alpha = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
   
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.billField.alpha = 1
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
           
            
            self.tipControl.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    struct Style{
        
        static var iseBlue = UIColor(red: 184 / 255 , green: 197 / 255 , blue: 214 / 255 , alpha: 1.0 )
        
    }
    
   
    
}




