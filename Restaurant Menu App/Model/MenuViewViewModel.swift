//
//  MenuViewViewModel.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import Foundation

class MenuViewViewModel: ObservableObject {
    @Published var foods: [MenuItem] = [
        MenuItem(id: UUID(), price: 9.99, title: "Food 1", menuCategory: .Food, ordersCount: 164, ingredients: [.Broccoli, .Spinach, .Carrot]),
        MenuItem(id: UUID(), price: 11.99, title: "Food 2", menuCategory: .Food, ordersCount: 42, ingredients: [.Pasta, .Spinach, .TomatoSauce]),
        MenuItem(id: UUID(), price: 4.99, title: "Food 3", menuCategory: .Food, ordersCount: 412, ingredients: [.Pasta, .Broccoli]),
        MenuItem(id: UUID(), price: 10.99, title: "Food 4", menuCategory: .Food, ordersCount: 99, ingredients: [.Pasta, .Broccoli, .TomatoSauce]),
        MenuItem(id: UUID(), price: 8.49, title: "Food 5", menuCategory: .Food, ordersCount: 231, ingredients: [.Broccoli, .Carrot, .Pasta, .TomatoSauce, .Spinach]),
        MenuItem(id: UUID(), price: 10.49, title: "Food 6", menuCategory: .Food, ordersCount: 434, ingredients: [.Pasta, .Carrot, .TomatoSauce]),
        MenuItem(id: UUID(), price: 6.99, title: "Food 7", menuCategory: .Food, ordersCount: 100, ingredients: [.Broccoli, .Carrot]),
        MenuItem(id: UUID(), price: 9.99, title: "Food 8", menuCategory: .Food, ordersCount: 211, ingredients: [.Broccoli, .Pasta, .TomatoSauce]),
        MenuItem(id: UUID(), price: 9.49, title: "Food 9", menuCategory: .Food, ordersCount: 543, ingredients: [.Pasta, .TomatoSauce, .Spinach]),
        MenuItem(id: UUID(), price: 11.99, title: "Food 10", menuCategory: .Food, ordersCount: 133, ingredients: [.Carrot, .Pasta, .TomatoSauce, .Spinach]),
        MenuItem(id: UUID(), price: 8.99, title: "Food 11", menuCategory: .Food, ordersCount: 321, ingredients: [.TomatoSauce, .Pasta, .Spinach]),
        MenuItem(id: UUID(), price: 10.49, title: "Food 12", menuCategory: .Food, ordersCount: 94, ingredients: [.Carrot, .Pasta, .TomatoSauce, .Spinach])
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
}
