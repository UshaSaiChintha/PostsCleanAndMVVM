//
//  PostsCleanAndMVVMUITests.swift
//  PostsCleanAndMVVMUITests
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import XCTest

final class PostsCleanAndMVVMUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVerifyPostsNavigationTitle() throws {
        // UI tests must launch the application that they test.
        
        let posts = app.staticTexts[pageTitle]
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(posts.exists)
    }
    
    func testVerifyDisplayOfPosts() throws {
        
        let firstPostTitle = "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
        let firstPostBody = "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        
        XCTAsyncAssert(app.staticTexts[firstPostTitle])
        XCTAsyncAssert(app.staticTexts.matching(multilineLabel: firstPostBody).element)
    }
    
    func testNavigateToPostsDetailsScreenAndVerifyText() throws {
        
        let firstPostTitle = "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
        
        app.staticTexts[firstPostTitle].waitForExistence(timeout: 10)
        app.staticTexts[firstPostTitle].tap()
        
        XCTAsyncAssert(app.buttons[pageTitle])
        XCTAsyncAssert(app.staticTexts[selectedTitleText])
        XCTAsyncAssert(app.staticTexts[firstPostTitle])
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
