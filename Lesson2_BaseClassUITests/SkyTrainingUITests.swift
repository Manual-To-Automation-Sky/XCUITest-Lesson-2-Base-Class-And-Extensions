//
//  SkyTrainingUITests.swift
//  SkyTrainingUITests
//
//  Created by Gary Behan on 23/08/2022.
//

import XCTest

class Lesson2_BaseClassUITests: BaseClassUI {


    func testAlert() throws {
        app.buttons["Alert"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Alert Test")
        XCTAssert(app.alerts.element.staticTexts["This is a native alert"].exists)
        
        app.alerts.scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func testTextField() throws {
        // The text that will be typed into the text field and then output to the label
        let textToEnter = "Sky App Training"
        
        // Get and tap the Text Field button on the main page
        app.buttons["Text Field"].tap()
        
        // Tap and enter text into the text field.
        let textField = app.textFields["TextField"]
        textField.tap()
        textField.typeText(textToEnter)
        
        // Assert that the label under the text field has been populated with the text we entered
        XCTAssertEqual(app.staticTexts["SubmittedTextLabel"].label, textToEnter)
    }
    
    func testSuccessLogin() throws {
        let username = "correct"
        let password = "please"
        
        app.buttons["Login"].tap()
        
        let usernameField = app.textFields["UsernameField"]
        usernameField.tap()
        usernameField.typeText(username)
        
        let passwordField = app.secureTextFields["PasswordField"]
        passwordField.tap()
        passwordField.typeText(password)
        
        app.buttons["LoginButton"].tap()
    }
    
    func testFailedLogin() throws {
        let username = "incorrect"
        let password = "please"
        
        app.buttons["Login"].tap()
        
        let usernameField = app.textFields["UsernameField"]
        usernameField.tap()
        usernameField.typeText(username)
        
        let passwordField = app.secureTextFields["PasswordField"]
        passwordField.tap()
        passwordField.typeText(password)
        
        app.buttons["LoginButton"].tap()
    }
}
