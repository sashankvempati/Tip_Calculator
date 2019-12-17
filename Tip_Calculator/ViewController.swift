//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Sashank Vempati on 12/13/19.
//  Copyright © 2019 Sashank Vempati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountValue: UITextField!
    @IBOutlet weak var taxValue: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var grandTotalValue: UILabel!
    @IBOutlet weak var amountPerPerson: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                
        let savedMode = UserDefaults.standard.bool(forKey: "darkMode")
        if savedMode == true {
            
            self.view.backgroundColor = UIColor.black
            amountValue.backgroundColor = UIColor.black
        }
        else {
            self.view.backgroundColor = UIColor.white
            amountValue.backgroundColor = UIColor.white
        }

        
        
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(amountValue.text!) ?? 0
        let tip = UserDefaults.standard.double(forKey: "tipPercentage")
        let tax = UserDefaults.standard.double(forKey: "taxPercentage")
        let people = UserDefaults.standard.double(forKey: "numberOfPeople")
        
        
        let taxAmount = tax * bill / 100
        let total = bill + taxAmount
        
        let tipAmount = total * tip / 100
        let grandTotal = total + tipAmount
        
        let totalPerPerson = grandTotal / people
        
        taxValue.text = String(format: "$%.2f", taxAmount)
        totalValue.text = String(format: "$%.2f", total)
        tipValue.text = String(format: "$%.2f", tipAmount)
        grandTotalValue.text = String(format: "$%.2f", grandTotal)
        amountPerPerson.text = String(format: "$%.2f", totalPerPerson)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let bill = Double(amountValue.text!) ?? 0
        //let tip = UserDefaults.standard.object(forKey: "tipPercentage")
        let tip = UserDefaults.standard.double(forKey: "tipPercentage")
        let tax = UserDefaults.standard.double(forKey: "taxPercentage")
        let people = UserDefaults.standard.double(forKey: "numberOfPeople")
        
        
        let taxAmount = tax * bill / 100
        let total = bill + taxAmount
        
        let tipAmount = total * tip / 100
        let grandTotal = total + tipAmount
        
        let totalPerPerson = grandTotal / people
        
        taxValue.text = String(format: "$%.2f", taxAmount)
        totalValue.text = String(format: "$%.2f", total)
        tipValue.text = String(format: "$%.2f", tipAmount)
        grandTotalValue.text = String(format: "$%.2f", grandTotal)
        amountPerPerson.text = String(format: "$%.2f", totalPerPerson)

        let savedMode = UserDefaults.standard.bool(forKey: "darkMode")
        if savedMode == true {
            
            self.view.backgroundColor = UIColor.black
            amountValue.backgroundColor = UIColor.black
        }
        else {
            self.view.backgroundColor = UIColor.white
            amountValue.backgroundColor = UIColor.white
        }

        
        
        
        
    }
    
    
}

