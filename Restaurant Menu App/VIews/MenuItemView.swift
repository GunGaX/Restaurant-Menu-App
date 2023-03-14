//
//  MenuItemView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
//    @Binding var searchText: String
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory, searchText: String) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
        self.searchText = searchText
        
    }
    
    var menuItems: [MenuItem]
    var menuCategory: MenuCategory
    var searchText: String
    
    private var ColumnsGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                if !searchResults.isEmpty {
                    Text(menuCategory.rawValue)
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            LazyVGrid(columns: ColumnsGrid) {
                ForEach(searchResults, id: \.self) { item in
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
    
    var searchResults: [MenuItem] {
        var finalArray: [MenuItem] = []
        if searchText.isEmpty {
            return menuItems
        } else {
            for item in menuItems {
                if item.title.lowercased().contains(searchText) {
                    finalArray.append(item)
                }
            }
            return finalArray
        }
       
    }
}

//struct MenuItemView_Previews: PreviewProvider {
//    @Binding var searchText: String
//
//    static var previews: some View {
//        let viewModel = MenuViewViewModel()
//        var searchText = searchText
//        MenuItemView(menuItems: viewModel.foods, menuCategory: .Food, searchText: searchText)
//    }
//}
