//
//  MenuViewViewModel.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import Foundation

//Mock-up of data
class MenuViewViewModel: ObservableObject {
    @Published var foods: [MenuItem] = [
        MenuItem(id: UUID(), price: 9.99, title: "Pasta Carbonara", menuCategory: .Food, ordersCount: 164, ingredients: [.Broccoli, .Spinach, .Carrot]),
        MenuItem(id: UUID(), price: 11.99, title: "Food 2", menuCategory: .Food, ordersCount: 42, ingredients: [.Pasta, .Spinach, .TomatoSauce]),
        MenuItem(id: UUID(), price: 4.99, title: "Food 3", menuCategory: .Food, ordersCount: 412, ingredients: [.Pasta, .Broccoli]),
        MenuItem(id: UUID(), price: 10.99, title: "Pie", menuCategory: .Food, ordersCount: 99, ingredients: [.Pasta, .Broccoli, .TomatoSauce]),
        MenuItem(id: UUID(), price: 8.49, title: "Food 5", menuCategory: .Food, ordersCount: 231, ingredients: [.Broccoli, .Carrot, .Pasta, .TomatoSauce, .Spinach]),
        MenuItem(id: UUID(), price: 10.49, title: "Food 6", menuCategory: .Food, ordersCount: 434, ingredients: [.Pasta, .Carrot, .TomatoSauce]),
        MenuItem(id: UUID(), price: 6.99, title: "Food 7", menuCategory: .Food, ordersCount: 100, ingredients: [.Broccoli, .Carrot])
    ]
    
    @Published var drinks: [MenuItem] = [
        MenuItem(id: UUID(), price: 4.99, title: "Drink 1", menuCategory: .Drink, ordersCount: 111, ingredients: []),
        MenuItem(id: UUID(), price: 5.99, title: "Drink 2", menuCategory: .Drink, ordersCount: 89, ingredients: []),
        MenuItem(id: UUID(), price: 4.99, title: "Drink 3", menuCategory: .Drink, ordersCount: 321, ingredients: []),
        MenuItem(id: UUID(), price: 3.99, title: "Drink 4", menuCategory: .Drink, ordersCount: 203, ingredients: []),
        MenuItem(id: UUID(), price: 3.49, title: "Drink 5", menuCategory: .Drink, ordersCount: 67, ingredients: []),
        MenuItem(id: UUID(), price: 4.59, title: "Drink 6", menuCategory: .Drink, ordersCount: 362, ingredients: []),
        MenuItem(id: UUID(), price: 4.99, title: "Drink 7", menuCategory: .Drink, ordersCount: 543, ingredients: []),
        MenuItem(id: UUID(), price: 5.99, title: "Drink 8", menuCategory: .Drink, ordersCount: 43, ingredients: [])
    ]
    
    @Published var desserts: [MenuItem] = [
        MenuItem(id: UUID(), price: 6.99, title: "Dessert 1", menuCategory: .Dessert, ordersCount: 172, ingredients: []),
        MenuItem(id: UUID(), price: 5.99, title: "Dessert 2", menuCategory: .Dessert, ordersCount: 321, ingredients: []),
        MenuItem(id: UUID(), price: 6.59, title: "Dessert 3", menuCategory: .Dessert, ordersCount: 332, ingredients: []),
        MenuItem(id: UUID(), price: 4.99, title: "Dessert 4", menuCategory: .Dessert, ordersCount: 210, ingredients: [])
    ]
    
    @Published var showSheet = false
    
    @Published var isFoodCategorySelected = true
    @Published var isDrinkCategorySelected = true
    @Published var isDessertCategorySelected = true
    
    @Published var sortMethod = SortBy.name
    
    func SortingCategory() {
        
        switch sortMethod {
        case .mostPopular:
            foods.sort() { $0.ordersCount > $1.ordersCount }
            drinks.sort() { $0.ordersCount > $1.ordersCount }
            desserts.sort() { $0.ordersCount > $1.ordersCount }
        case .price:
            foods.sort() { $0.price < $1.price }
            drinks.sort() { $0.price < $1.price }
            desserts.sort() { $0.price < $1.price }
        case .name:
            foods.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            drinks.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            desserts.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }        }
    }
    
    func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
            let lhsTitle = lhs.title.split(separator: " ")
            let rhsTitle = rhs.title.split(separator: " ")
            let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
            let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
            if lhsNumber != rhsNumber {
                return lhsNumber < rhsNumber
            } else {
                return lhs.title < rhs.title
            }
        }
    
    }
    
