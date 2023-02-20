//
//  MenuItemsOptionView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationView {
            
            List {
                Section("SORTING") {
                    Picker("Sort by", selection: $viewModel.sortMethod) {
                        ForEach(SortBy.allCases, id: \.self) { item in
                            Text(item.rawValue).tag(item)
                        }
                    }
                }
                
                Section("SELECTED CATEGORIES") {
                    Toggle(MenuCategory.Food.rawValue, isOn: $viewModel.isFoodCategorySelected)
                    Toggle(MenuCategory.Drink.rawValue, isOn: $viewModel.isDrinkCategorySelected)
                    Toggle(MenuCategory.Dessert.rawValue, isOn: $viewModel.isDessertCategorySelected)
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                Button {
                    viewModel.SortingCategory()
                    viewModel.showSheet = false
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
    static var previews: some View {
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}
