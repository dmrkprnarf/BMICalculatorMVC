//
//  CalculateBrain.swift
//  BMICalculator
//
//  Created by Arif Demirkoparan on 15.01.2023.
//

import Foundation
import UIKit

struct CalculateBrain {
    
    var calculateBMI:BMI?
    
    mutating func calculate (_ height:Float, _ weight:Float) {
        let calculateFloat = weight / (height * height)
        if calculateFloat  <=  18.5 {
            calculateBMI =  BMI(value: calculateFloat, advice: "WEAK", color: .red)
        } else if  calculateFloat >= 18.5 && calculateFloat < 24.9 {
            calculateBMI =  BMI(value: calculateFloat, advice: "NORMAL", color: .green)
        } else if  calculateFloat >= 24.9 && calculateFloat < 29.9 {
            calculateBMI = BMI(value: calculateFloat, advice: "FAT", color: .orange)
        } else if calculateFloat >= 29.9 && calculateFloat < 34.9 {
            calculateBMI =  BMI(value: calculateFloat, advice: "1st Degree OBESITY", color: .systemRed)
        } else if calculateFloat >= 34.9 && calculateFloat < 39.9 {
            calculateBMI =  BMI(value: calculateFloat, advice: "2nd DEGREE OBESITY", color: .brown)
        }else {
            calculateBMI = BMI(value: calculateFloat, advice: "Your value out of range ", color: .white)
        }
    }
    
    func getValue() -> Float{
        return calculateBMI?.value ?? 0.0
    }
    
    func getAdvice()  -> String{
        return calculateBMI?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return calculateBMI?.color ?? .white
    }
    
    func getWeightValue(_ weight:Float) -> Float{
        let height =   String(format: "%.f", weight)
        return  Float(height) ?? 0.0
    }
    
    func getHeightValue(_ height:Float) -> Float{
        let StringFormat = String(format: "%.2f", height)
        return Float(StringFormat) ?? 0.0
    }
}
