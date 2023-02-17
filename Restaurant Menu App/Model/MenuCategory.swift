//
//  MenuCategory.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import Foundation

enum MenuCategory: String, CaseIterable {
    case Food = "Food"
    case Drink = "Drink"
    case Dessert = "Dessert"
}

enum SortBy: String, CaseIterable {
    case first = "Most Popular"
    case second = "Price $-$$$"
    case third = "Name A-Z"
}
