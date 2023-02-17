//
//  MenuItemView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    var menuItems: [MenuItem]
    var menuCategory: MenuCategory
    
    private var ColumnsGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
            LazyVGrid(columns: ColumnsGrid) {
                ForEach(menuItems, id: \.self) { item in
                    NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                        VStack {
                            Rectangle()
                                .cornerRadius(16)
                            Text(item.title)
                        }
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        .frame(height: 150)
                    }
                }
            }
        }
        .padding()
    }
}
struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel()
        MenuItemView(menuItems: viewModel.drinks, menuCategory: .Drink)
    }
}
