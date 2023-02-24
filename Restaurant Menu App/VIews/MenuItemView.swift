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
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 120)
                                .clipped()
                            
                            HStack {
                                Text(item.title)
                                    .foregroundColor(Color.primary)
                                    .lineLimit(1)
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.bottom, 0)
                            
                            HStack {
                                Spacer()
                                Text(String(format: "%.2f", item.price) + " $")
                                    .foregroundColor(Color.primary)
                                    .bold()
                                    .padding(.trailing)
                            }
                            .padding(.bottom, 5)
                            
                        }
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .background(Color("backgroundColor"))
                        
                    }
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 1)
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
