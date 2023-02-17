//
//  MenuItemsView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemsView: View {
    @State public var showSheet = false
    
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                MenuItemView(menuItems: viewModel.foods, menuCategory: .Food).environmentObject(viewModel)
                MenuItemView(menuItems: viewModel.drinks, menuCategory: .Drink).environmentObject(viewModel)
                MenuItemView(menuItems: viewModel.desserts, menuCategory: .Dessert).environmentObject(viewModel)
                
                    .navigationTitle("Menu")
                    .toolbar {
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .bold()
                                .font(.title3)
                        }
                        .sheet(isPresented: $showSheet) {
                            MenuItemsOptionView(showSheet: $showSheet)
                                .presentationDetents([.fraction(0.8), .large])
                            
                        }
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

