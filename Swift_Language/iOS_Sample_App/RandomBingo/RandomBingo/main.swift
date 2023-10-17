//
//  main.swift
//  RandomBingo
//
//  Created by 1000288 on 2023/10/17.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0

while true {
    var userInput = readLine()
    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }

    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo!!")
        break
    }
}


