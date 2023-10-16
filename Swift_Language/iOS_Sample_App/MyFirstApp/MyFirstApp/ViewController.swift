//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 1000288 on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {
    var isInitText = false

    // Interface Builder = IB(뷰-객체와 연결된 Outlet)
    @IBOutlet weak var mainLabel: UILabel!

    // Interface Builder = (뷰-객체)와 연결된 Action
    @IBAction func buttonPressed(_ sender: Any) {
        
        if(!isInitText){
            isInitText = true
            mainLabel.text = "안녕하세요."
        } else {
            isInitText = false
            mainLabel.text = "반갑습니다."
            mainLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }
    
    
    // 앱이 실행될때 처음 실행되는 부분
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

