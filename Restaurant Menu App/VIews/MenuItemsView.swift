//
//  MenuItemsView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemsView: View {
    
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isFoodCategorySelected {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .Food).environmentObject(viewModel)
                }
                if viewModel.isDrinkCategorySelected {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .Drink).environmentObject(viewModel)
                }
                if viewModel.isDessertCategorySelected {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .Dessert).environmentObject(viewModel)
                }
            }
            VStack {
                if !viewModel.isFoodCategorySelected && !viewModel.isDrinkCategorySelected && !viewModel.isDessertCategorySelected {
                    Text("Select Category")
                        .foregroundColor(Color.gray)
                        .font(.title)
                    Spacer()
                }
            }
            
            .navigationTitle("Menu")
            .toolbar {
                Button {
                    viewModel.showSheet.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .bold()
                        .font(.title3)
                }
                .sheet(isPresented: $viewModel.showSheet) {
                    MenuItemsOptionView().environmentObject(viewModel)
                        .presentationDetents([.fraction(0.8), .large])
                    
                }
            }
            
        }
        .padding(.bottom)
    }
}


struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}

