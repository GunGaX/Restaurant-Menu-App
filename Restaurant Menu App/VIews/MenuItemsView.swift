//
//  MenuItemsView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemsView: View {
    
    @StateObject private var viewModel = MenuViewViewModel()
    
    @AppStorage("colorScheme") var colorScheme: Bool = true
    
    @State var searchText = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if viewModel.isFoodCategorySelected {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .Food, searchText: searchText).environmentObject(viewModel)
                }
                if viewModel.isDrinkCategorySelected {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .Drink, searchText: searchText).environmentObject(viewModel)
                }
                if viewModel.isDessertCategorySelected {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .Dessert, searchText: searchText).environmentObject(viewModel)
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
                        .preferredColorScheme(colorScheme ? .light : .dark)
                        .presentationDetents([.fraction(0.8), .large])
                }
            }
            
        }
        .searchable(text: $searchText, prompt: "Look for something")
        .padding(.bottom, 1)
        .onAppear {
            viewModel.SortingCategory()
        }
    }
}


struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}

