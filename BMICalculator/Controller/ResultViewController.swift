//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Arif Demirkoparan on 15.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: Float?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dissmisButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateUI() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        dissmisButton.layer.cornerRadius = 5
        subtitleLabel.text = advice
        resultLabel.text = "\(String(format: "%.2f", result ?? 0.0))kg/m²"
        view.backgroundColor = color
    }
}
