//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 1000288 on 2023/10/17.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.default
        textField.placeholder = "텍스트를 입력하세요."
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = .go
    }
    
    // 텍스트필드의 입력을 시작할때 호출됨 -> 시작할지말지에 대한 여부를 허락
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 입력이 시작되는 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트필드의 입력을 시작했어요.")
    }
    
    // clearButton이 동작되지 않도록 논리를 부여할수 있음
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
      return true
    }
    
    // 텍스트필드의 글자 내용이 한글자씩 입력되거나 지워질때 호출되고 편집상태를 부여할 수 있음
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
    
    
}

