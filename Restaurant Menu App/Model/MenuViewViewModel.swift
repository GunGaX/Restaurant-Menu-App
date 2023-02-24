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
        MenuItem(id: UUID(), price: 9.99, title: "Pasta Carbonara", menuCategory: .Food, ordersCount: 164, ingredients: [.Broccoli, .Spinach, .Carrot], description: "Spaghetti carbonara is an Italian main course consisting of spaghetti (long thin strands of pasta) with bacon and a creamy sauce made from eggs, Pecorino or Parmesan and black pepper. The dish is probably from Rome.", imageName: "PastaCarbonara"),
        MenuItem(id: UUID(), price: 11.99, title: "Noodle soup", menuCategory: .Food, ordersCount: 42, ingredients: [.Pasta, .Spinach, .TomatoSauce], description: "Chicken soup is a soup made from chicken, simmered in water, usually with various other ingredients. The classic chicken soup consists of a clear chicken broth, often with pieces of chicken or vegetables; common additions are pasta, noodles, dumplings, or grains such as rice and barley.", imageName: "NoodleSoup"),
        MenuItem(id: UUID(), price: 4.99, title: "Lazagna", menuCategory: .Food, ordersCount: 412, ingredients: [.Pasta, .Broccoli], description: "Lasagna is a wide, flat sheet of pasta. Lasagna can refer to either the type of noodle or to the typical lasagna dish which is a dish made with several layers of lasagna sheets with sauce and other ingredients, such as meats and cheese, in between the lasagna noodles.", imageName: "Lazagna"),
        MenuItem(id: UUID(), price: 10.99, title: "Ramen", menuCategory: .Food, ordersCount: 99, ingredients: [.Pasta, .Broccoli, .TomatoSauce], description: "Simply put, ramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodle and a selection of meats or vegetables, often topped with a boiled egg.", imageName: "Ramen"),
        MenuItem(id: UUID(), price: 8.49, title: "Chicken burger", menuCategory: .Food, ordersCount: 231, ingredients: [.Broccoli, .Carrot, .Pasta, .TomatoSauce, .Spinach], description: "A chicken burger makes for a quick midweek meal or weekend BBQ’s with friends! Crispy seasoned chicken breast, topped with mandatory melted cheese, piled onto soft rolls with onion, avocado, lettuce, tomato and garlic mayo.", imageName: "ChickenBurger"),
        MenuItem(id: UUID(), price: 10.49, title: "Rice with vegetables", menuCategory: .Food, ordersCount: 434, ingredients: [.Pasta, .Carrot, .TomatoSauce], description: "Rice is the seed of a semi-aquatic grass (Oryza sativa) that is cultivated extensively in warm climates in many countries, including the United States, for its edible grain. It is a staple food throughout the world.", imageName: "RiceWithVegetables"),
        MenuItem(id: UUID(), price: 6.99, title: "Caesar salad", menuCategory: .Food, ordersCount: 100, ingredients: [.Broccoli, .Carrot, .Spinach], description: "A Caesar salad (also spelled Cesar and Cesare) is a green salad of romaine lettuce and croutons dressed with lemon juice (or lime juice), olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper. In its original form, this salad was prepared and served tableside.", imageName: "CaesarSalad")
    ]
    
    @Published var drinks: [MenuItem] = [
        MenuItem(id: UUID(), price: 4.99, title: "Mojito", menuCategory: .Drink, ordersCount: 111, ingredients: [], description: "A mojito is a classic highball drink that originated in Cuba. Not surprisingly, this cocktail uses ingredients indigenous to Cuba, including rum, lime, mint, and sugar. The mixture is topped off with a little club soda to create a thirst-quenching libation.", imageName: "Mojito"),
        MenuItem(id: UUID(), price: 3.99, title: "Tea", menuCategory: .Drink, ordersCount: 203, ingredients: [], description: "Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis, an evergreen shrub native to East Asia which probably originated in the borderlands of southwestern China and northern Myanmar.", imageName: "Tea"),
        MenuItem(id: UUID(), price: 3.49, title: "Latte", menuCategory: .Drink, ordersCount: 67, ingredients: [], description: "A latte or caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top. If you don't drink dairy milk, you can easily swap it for a plant-based alternative like soy, oat or coconut milk.", imageName: "Latte"),
        MenuItem(id: UUID(), price: 4.59, title: "Lemonade", menuCategory: .Drink, ordersCount: 362, ingredients: [], description: "Lemonade is a sweetened beverage made from lemons, sugar, and water. It is popular in the United States during the spring and summer, when it is generally served chilled with ice. In some countries, the word 'lemonade' is also used to describe any clear carbonated drink; in others, it means any fruit-flavored soda.", imageName: "Lemonade"),
        MenuItem(id: UUID(), price: 5.99, title: "Orange Juice", menuCategory: .Drink, ordersCount: 43, ingredients: [], description: "Orange juice is a fruit juice obtained by squeezing, pressing or otherwise crushing the interior of an orange. Orange juice is a nutrition powerhouse with naturally occurring vitamins and minerals and many antioxidants. All types of juice can be found in health food and grocery stores.", imageName: "OrangeJuice")
    ]
    
    @Published var desserts: [MenuItem] = [
        MenuItem(id: UUID(), price: 6.99, title: "Napoleon", menuCategory: .Dessert, ordersCount: 172, ingredients: [], description: "The Napoleon cake is composed of many layers of puff pastry with a whipped pastry cream filling and encrusted with more pastry crumbs. After assembling, the cake is chilled overnight to allow the pastry layers to soften and absorb some of the cream, similar to the classic American icebox cake.", imageName: "Napoleon"),
        MenuItem(id: UUID(), price: 5.99, title: "Tiramisu", menuCategory: .Dessert, ordersCount: 321, ingredients: [], description: "Tiramisù is a layered no-bake dessert consisting of ladyfingers soaked with coffee and rum, then layered with a whipped mixture of sugar, eggs and the creamy, sweet mascarpone cheese sprinkled with cocoa.", imageName: "Tiramisu"),
        MenuItem(id: UUID(), price: 6.59, title: "Ice cream chocolate", menuCategory: .Dessert, ordersCount: 332, ingredients: [], description: "Ice cream is a frozen dairy dessert obtained by freezing the ice cream mix with continuous agitation. It contains milk products, sweetening materials, stabilizers, colors, flavors, and egg products. Ice cream had its origins in Europe and was introduced later in the United States where it developed into an industry.", imageName: "IceCream")
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
            foods.sort() { $0.title < $1.title }
            drinks.sort() { $0.title < $1.title }
            desserts.sort() { $0.title < $1.title }
        }
    }
    
    func foo(item: MenuItem) -> String {
        var final: String = ""
        for ingredient in item.ingredients {
            final += ingredient.rawValue
            if ingredient != item.ingredients.last {
                final += ", "
            }
        }
        
        return final
    }
}
