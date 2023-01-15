//
//  ViewController.swift
//  BMICalculator
//
//  Created by Arif Demirkoparan on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weighSlider: UISlider!
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func heighSliderAction(_ sender: UISlider) {
        let height = sender.value
        heightLabel.text = "\(calculateBrain.getHeightValue(height))m"
    }
    
    @IBAction func weightSliderAction(_ sender: UISlider) {
        let weight = sender.value
        weightLabel.text = "\(calculateBrain.getWeightValue(weight))Kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        calculateBrain.calculate(heightSlider.value, weighSlider.value)
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let secondVC = segue.destination as! ResultViewController
            secondVC.result  = calculateBrain.getValue()
            secondVC.advice = calculateBrain.getAdvice()
            secondVC.color = calculateBrain.getColor()
        }
    }
    func updateUI(){
        let height = calculateBrain.getHeightValue(heightSlider.value)
        let weight = calculateBrain.getWeightValue(weighSlider.value)
        heightLabel.text = "\(height)m"
        weightLabel.text = "\(weight)Kg"
        calculateButton.layer.cornerRadius = 5
    }
    
}

