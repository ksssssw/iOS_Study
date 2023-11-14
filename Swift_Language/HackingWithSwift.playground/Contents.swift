import UIKit

func greetUser() {
    print("Hi ther!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 50, using: {
    Int.random(in: 1...20)
})

print(rolls)
