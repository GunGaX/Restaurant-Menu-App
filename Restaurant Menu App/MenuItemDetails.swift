//
//  MenuItemDetails.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    var body: some View {
        NavigationStack {
            Image("LittleLemonLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .navigationTitle(menuItem.title)
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
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel().drinks
        MenuItemDetailsView(menuItem: viewModel[4])
    }
}
