//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.data = "안녕하세요."
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            secondVC.data = "안녕하세요2"
            present(secondVC, animated: true, completion: nil)
        }
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            if let thirdVC = segue.destination as? ThirdViewController {
                thirdVC.data = "안녕하세요.3"
            }
        }
        
        if segue.identifier == "toFourthVC" {
            if let thirdVC = segue.destination as? FourthViewController {
                thirdVC.data = "안녕하세요.4"
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 어떤 조건에 따라서 세그웨이를 실행시킬지 말지를 결정하는 함수임 -> 버튼에서 직접적인 세그웨이를 만들었을때만 동작함
        return false
    }

    
}

