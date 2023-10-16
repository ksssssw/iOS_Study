//
//  ViewController.swift
//  DiceGame
//
//  Created by 1000288 on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경함
        firstImageView.image = diceArray.randomElement()
        
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경함
        secondImageView.image = diceArray.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

