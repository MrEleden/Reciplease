//
//  SessionManagerFake.swift
//  RecipleaseTests
//
//  Created by Christophe DURAND on 02/11/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation
import Alamofire

class SessionManagerFake: SessionManager {
    var data: Data?
    var error: Error?
    var response: HTTPURLResponse?
    
    init(data: Data?, error: Error?, response: HTTPURLResponse?) {
        self.data = data
        self.error = error
        self.response = response
        super.init()
    }
    
//    override func request() {
//
//    }
    
    
}

struct FakeResponse {
    var data: Data?
    var error: Error?
    var response: HTTPURLResponse?
}
