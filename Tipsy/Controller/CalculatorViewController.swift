//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var tenBtn: UIButton!
    @IBOutlet weak var twentyBtn: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipPer: Float?
    var pay: Float?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        disableSelect()
        sender.isSelected = true
        tipPer = Float(sender.currentTitle!.replacingOccurrences(of: "%", with: ""))! / 100
    }
    
    @IBAction func stepperValChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = (Float(billTextField.text!)! + Float(billTextField.text!)! * tipPer!)
        pay = total / Float(splitNumberLabel.text!)!
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func disableSelect() {
        zeroBtn.isSelected = false
        tenBtn.isSelected = false
        twentyBtn.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.bill = pay
            resultVC.setting = "Split between \(Int(splitNumberLabel.text!)!) people, with \(Int((tipPer!) * 100))% tip."
        }
    }
}

