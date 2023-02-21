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
                            Image("PastaCarbonara")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 120)
                                .clipped()
                            
                            HStack {
                                Text(item.title)
                                    .foregroundColor(Color.black)
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.bottom, 0)
                            
                            HStack {
                                Spacer()
                                Text(String(format: "%.2f", item.price) + " $")
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .padding(.trailing)
                            }
                            .padding(.bottom, 5)
                            
                        }
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .background(Color.white)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16,
                                                style: .continuous))
                    .shadow(color: Color.gray.opacity(0.5), radius: 8, x: 0, y: 1)
                }
            }
        }
        .padding()
    }
}
struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel()
        MenuItemView(menuItems: viewModel.foods, menuCategory: .Food)
    }
}
