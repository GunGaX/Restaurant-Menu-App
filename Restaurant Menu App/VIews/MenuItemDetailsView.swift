//
//  MenuItemDetailsView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("PastaCarbonara")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:300)
                    .shadow(color: Color.gray.opacity(0.4), radius: 100, x: 0, y:10)
                
                Group {
                    Text("Price:")
                        .font(.title3)
                        .bold()
                    Text(String(format: "%.2f", menuItem.price))
                        .padding(.bottom)
                    Text("Ordered:")
                        .font(.title3)
                        .bold()
                    Text("\(menuItem.ordersCount)")
                        .padding(.bottom)
                    
                    if menuItem.ingredients != [] {
                        Text("Ingredients:")
                            .font(.title3)
                            .bold()
                        VStack {
                            ForEach(menuItem.ingredients, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
                
            }
            .navigationTitle(menuItem.title)
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel().foods
        MenuItemDetailsView(menuItem: viewModel[4])
    }
}
