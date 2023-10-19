//
//  ThirdViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = data

    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
