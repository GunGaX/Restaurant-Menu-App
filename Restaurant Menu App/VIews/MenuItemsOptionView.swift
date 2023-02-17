//
//  MenuItemsOptionView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

enum SelectedCategories: String, CaseIterable {
    case Food = "Food"
    case Drink = "Drink"
    case Dessert = "Dessert"
}

enum SortBy: String, CaseIterable {
    case first = "Most Popular"
    case second = "Price $-$$$"
    case third = "Name A-Z"
}

struct MenuItemsOptionView: View {
    @Binding var showSheet: Bool
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    ForEach(SelectedCategories.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                Section(header: Text("SORT BY")) {
                    ForEach(SortBy.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                Button {
                    showSheet = false
                } label: {
                    Text("Done")
                        .bold()
                        .font(.title3)
                }
            }
        }
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    @State static var showSheet = true
    static var previews: some View {
        MenuItemsOptionView(showSheet: $showSheet)
    }
}
