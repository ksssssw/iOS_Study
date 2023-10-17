//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 1000288 on 2023/10/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        slider.isEnabled = false
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        
        //        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
        //
        //            if number > 0 {
        //                number -= 1
        //                slider.setValue(Float(number) / 60, animated: true)
        //                mainLabel.text = "\(number) 초"
        //            } else {
        //                AudioServicesPlayAlertSound(SystemSoundID(1322))
        //
        //                number = 0
        //                configureUI()
        //                slider.isEnabled = true
        //                timer?.invalidate()
        //            }
        //        }
    }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.setValue(Float(number) / 60, animated: true)
            mainLabel.text = "\(number) 초"
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            
            number = 0
            configureUI()
            slider.isEnabled = true
            timer?.invalidate()
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        slider.isEnabled = true
        configureUI()
    }
    
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
    }
    
    
}

