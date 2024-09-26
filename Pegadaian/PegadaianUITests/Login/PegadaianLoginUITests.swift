//
//  PegadaianLoginUITests.swift
//  PegadaianUITests
//
//  Created by FDN-Azhar on 26/09/24.
//


import XCTest
@testable import Pegadaian

class PegadaianLoginUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        //PGSKeychain.shared.clearKeychainData()
        app.launch()
    }
    
    func testLoginFlow() {
        app.textFields["Login.accountTextField"].tap()
        app.textFields["Login.accountTextField"].typeText("emilys")
        
        app.secureTextFields["Login.passwordTextField"].tap()
        app.secureTextFields["Login.passwordTextField"].typeText("emilyspasse")
        app.children(matching: .window).firstMatch.tap()
        
        app.buttons["Login.loginButton"].tap()
        
        //XCTAssert(app.alerts.accessibilityLabel["Login.errorAlert"].waitForExistence(timeout: 1))
    }
}
