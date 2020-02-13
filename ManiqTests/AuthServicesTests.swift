//
//  AuthServicesTests.swift
//  ManiqTests
//
//  Created by Сергей Гаврилов on 13.02.2020.
//  Copyright © 2020 Сергей Гаврилов. All rights reserved.
//

import XCTest
@testable import Pods_Maniq
@testable import Maniq

class AuthServicesTests: XCTestCase {
    
    
    var auth: AuthServices!

    override func setUp() {
        super.setUp()
        auth = AuthServices()
    }

    override func tearDown() {
        super.tearDown()
        auth = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginSuccess() {
        auth.login(email: "wrongMail.com", password: "123456") {
            
        }
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
