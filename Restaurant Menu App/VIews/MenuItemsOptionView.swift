//
//  MenuItemsOptionView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
//    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationView {
            
            List {
                Section("SELECTED CATEGORY") {
                    Toggle(MenuCategory.Food.rawValue, isOn: $viewModel.isFoodCategorySelected)
                    Toggle(MenuCategory.Drink.rawValue, isOn: $viewModel.isDrinkCategorySelected)
                    Toggle(MenuCategory.Dessert.rawValue, isOn: $viewModel.isDessertCategorySelected)
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
//    @State static var showSheet = true
    static var previews: some View {
//        MenuItemsOptionView(showSheet: $showSheet)
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}