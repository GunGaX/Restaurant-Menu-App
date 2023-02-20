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
    case name = "Name A-Z"
    case price = "Price $-$$$"
    case mostPopular = "Most Popular"
}
