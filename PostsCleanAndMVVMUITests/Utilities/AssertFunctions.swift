//
//  AssertFunctions.swift
//  PostsCleanAndMVVMUITests
//
//  Created by Usha Sai Chintha on 04/05/23.
//

import Foundation
import XCTest

func XCTAsyncAssert(_ element: XCUIElement) {
    let isElementExist = element.waitForExistence(timeout: 2)
    if isElementExist {
        XCTAssertTrue(element.exists)
    }
}
