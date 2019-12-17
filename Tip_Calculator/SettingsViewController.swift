//
//  SettingsViewController.swift
//  Tip_Calculator
//
//  Created by Sashank Vempati on 12/13/19.
//  Copyright © 2019 Sashank Vempati. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentage: UILabel!
    
    @IBOutlet weak var taxPercentage: UILabel!
    
    @IBOutlet weak var numberOfPeople: UILabel!
    
    @IBOutlet weak var nightMode: UISwitch!
    
    @IBOutlet weak var Tipslider: UISlider!
    
    @IBOutlet weak var Taxslider: UISlider!
    
    @IBOutlet weak var PeopleStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nightMode.setOn(false, animated: true)
        let savedTip = UserDefaults.standard.integer(forKey: "tipPercentage")
        let savedPeople = UserDefaults.standard.object(forKey: "numberOfPeople")
        let savedMode = UserDefaults.standard.object(forKey: "darkMode")
        let savedTax = UserDefaults.standard.integer(forKey: "taxPercentage")
        
        if let people = savedPeople as? String{
            numberOfPeople.text = people
        }
        if let mode = savedMode as? Bool {
            if(mode){
                self.view.backgroundColor = UIColor.black
            }
            nightMode.setOn(mode, animated: true)
        }
        
        tipPercentage.text = String(savedTip)
        taxPercentage.text = String(savedTax)
        
        Tipslider.setValue(Float(savedTip), animated: true)
        Taxslider.setValue(Float(savedTax), animated: true)
        
        PeopleStepper.value = UserDefaults.standard.double(forKey: "peopleStepper")
        
    }

    @IBAction func slider(_ sender: UISlider) {
        tipPercentage.text = String(Int(sender.value))
        UserDefaults.standard.set(tipPercentage.text, forKey: "tipPercentage")
        
        UserDefaults.standard.set(Tipslider.currentThumbImage, forKey: "tipSliderPos")
        

        
        
    }
    
    
    @IBAction func taxSlider(_ sender: UISlider) {
        taxPercentage.text = String(Int(sender.value))
        UserDefaults.standard.set(taxPercentage.text, forKey: "taxPercentage")
    }
    
    
    @IBAction func stepper(_ sender: UIStepper) {
        numberOfPeople.text = String(Int(sender.value))
        UserDefaults.standard.set(numberOfPeople.text, forKey: "numberOfPeople")
        
        UserDefaults.standard.set(PeopleStepper.value, forKey: "peopleStepper")
    }
    
    
    @IBAction func darkMode(_ sender: UISwitch) {
        
        if (sender.isOn == true ){
            print("Yes boi")
            self.view.backgroundColor = UIColor.black
            UserDefaults.standard.set(true, forKey: "darkMode")
            
            
        }
        else{
            print("No boi")
            self.view.backgroundColor = UIColor.white
            UserDefaults.standard.set(false, forKey: "darkMode")
        }
        
    }
    

}
