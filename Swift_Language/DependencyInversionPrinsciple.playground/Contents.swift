import UIKit

protocol TestProtocol {
    func f() -> Void
}

class N: TestProtocol {
    func f() {
        print("this is F..")
    }
}

class NSuper: TestProtocol {
    func f() {
        print("this is super F..")
    }
}

class M {
    var provider: TestProtocol
    
    init(provider: TestProtocol) {
        self.provider = provider
    }
    
    func doF() {
        provider.f()
    }
}

var provider = N()
var m = M(provider: provider)
m.doF()

var providerNSuper = NSuper()
var mSuper = M(provider: providerNSuper)
mSuper.doF()
