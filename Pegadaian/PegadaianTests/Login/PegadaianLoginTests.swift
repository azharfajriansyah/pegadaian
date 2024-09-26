//
//  PegadaianLoginTests.swift
//  PegadaianTests
//
//  Created by FDN-Azhar on 26/09/24.
//

import XCTest

@testable import Pegadaian

final class PegadaianLoginTests: XCTestCase {
    
    var module: PegadaianLoginMockModule?

    override func setUpWithError() throws {
        module = PegadaianLoginMockModule()
    }

    override func tearDownWithError() throws {
        module = nil
    }
    
    func testLoginWithInvalidCredential() {
        let expectation = self.expectation(description: "Login with invalid credential, so the credential and token keychain won't be set")
        PGSKeychain.shared.clearKeychainData()
        module?.presenter?.didUserSelectLogin(username: "emilys", password: "wrongPassword")
        let result = XCTWaiter.wait(for: [expectation], timeout: 5)
        if result == XCTWaiter.Result.timedOut {
            expectation.fulfill()
            XCTAssertNil(PGSKeychain.shared.retrieveCredentials())
            XCTAssertNil(PGSKeychain.shared.retrieveApiToken())
        }
    }

    func testLoginWithValidCredential() {
        let expectation = self.expectation(description: "Login with valid credential, so the credential and token keychain will have a value")
        PGSKeychain.shared.clearKeychainData()
        module?.presenter?.didUserSelectLogin(username: "emilys", password: "emilyspass")
        let result = XCTWaiter.wait(for: [expectation], timeout: 5)
        if result == XCTWaiter.Result.timedOut {
            expectation.fulfill()
            XCTAssertNotNil(PGSKeychain.shared.retrieveCredentials())
            XCTAssertNotNil(PGSKeychain.shared.retrieveApiToken())
        }
    }

}
