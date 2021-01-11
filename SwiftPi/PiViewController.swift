//
//  PiViewController.swift
//  SwiftPi
//
//  Created by Josselin Abel on 04/01/2021.
//

import UIKit

class PiViewController: UIViewController {
    @IBOutlet weak var piView: PiView!
    var sliderValue = 0
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var piLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValue = Int(sender.value)
        piView.drawPoint(nbPoint: sliderValue)
        sliderLabel.text = "\(sliderValue)"
        piView.setNeedsDisplay()
        if piView.nbPointInCircle > 0 {
            let piValue =  4 * CGFloat(piView.nbPointInCircle)/CGFloat(piView.nbPointTotal)
            let piRounded = CGFloat(round(1000*piValue)/1000)
            piLabel.text = "\(piRounded)"
        }
    }
    
    
    
}
