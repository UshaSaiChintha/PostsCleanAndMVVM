//
//  XCUIElementQuery.swift
//  PostsCleanAndMVVMUITests
//
//  Created by Usha Sai Chintha on 04/05/23.
//

import Foundation
import XCTest

extension XCUIElementQuery {
    func matching(multilineLabel label: String) -> XCUIElementQuery {
        matching(NSPredicate(format: "label == %@", label))
    }
}
