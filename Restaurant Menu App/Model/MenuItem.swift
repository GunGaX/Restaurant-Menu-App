//
//  MenuItem.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID {get}
    var price: Double {get}
    var title: String {get}
    var menuCategory: MenuCategory {get}
    var ordersCount: Int {get set}
    var ingredients: [Ingredient] {get set}
}

struct MenuItem: Identifiable, Hashable, MenuItemProtocol {
    let id: UUID
    let price: Double
    let title: String
    let menuCategory: MenuCategory
    var ordersCount: Int
    var ingredients: [Ingredient]
}
