//
//  Restaurant_Menu_AppTests.swift
//  Restaurant Menu AppTests
//
//  Created by Dmytro Savka on 18.02.2023.
//

import XCTest
@testable import Restaurant_Menu_App

final class MenuItemsTests: XCTestCase {
    
    let viewModel = MenuViewViewModel()
    
    func test_FoodItem() {
        let tittle = viewModel.foods[0].title
        XCTAssertEqual(tittle, "Food 1")
    }
    
    func test_IngredientsItem() {
        let ingredients = viewModel.foods[0].ingredients
        XCTAssertEqual(ingredients, [.Broccoli, .Spinach, .Carrot])
    }
    
}
