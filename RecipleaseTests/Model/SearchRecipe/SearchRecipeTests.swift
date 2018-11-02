//
//  SearchRecipeTests.swift
//  RecipleaseTests
//
//  Created by Christophe DURAND on 02/11/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import XCTest
import Alamofire
@testable import Reciplease

class SearchRecipeTests: XCTestCase {
    
    func testGetRecipeShouldGetFailedCompletionIfError() {
        //Given
        let searchRecipeService = SearchRecipeService()
        
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        searchRecipeService.getRecipe(ingredients: []) { (success, recipe) in
            //Then
            XCTAssertFalse(success)
            XCTAssertNil(recipe)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetRecipeShouldGetSuccessCompletionIfNoErrorAndCorrectData() {
        // Given
        let searchRecipeService = SearchRecipeService()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        searchRecipeService.getRecipe(ingredients: ["lemon", "cheese"]) { (success, recipe) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(recipe)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
