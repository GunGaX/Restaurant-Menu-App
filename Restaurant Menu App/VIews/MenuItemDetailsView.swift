//
//  MenuItemDetailsView.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    @StateObject private var viewModel = MenuViewViewModel()
    
    var menuItem: MenuItem
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Image(menuItem.imageName)
                        .resizable()
                        .frame(height:250)
                        .cornerRadius(30)
                    
                    
                    Group {
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                
                                Spacer()
                                
                                Text(String(format: "%.2f", menuItem.price) + " $")
                                    .font(.title)
                                    .bold()
                            }
                            
                            Divider()
                                .frame(height: 0.3)
                                .overlay(.secondary)
                            
                            HStack {
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(Color.gray)

                                Spacer()

                                Text("\(menuItem.ordersCount)")
                                    .font(.title3)
                                    .bold()
                                
                                Text("orders")
                            }
                            
                            Divider()
                                .frame(height: 0.3)
                                .overlay(.secondary)
                            
                            Image(systemName: "menucard.fill")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                            
                            Text("We use only high quality products and products of our own production.")
                                .multilineTextAlignment(.center)
                            
                            if menuItem.ingredients != [] {
                                HStack {
                                    Text("Dish components")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                
                                Text(viewModel.foo(item: menuItem))
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, -10)
                            }
                            
                            Divider()
                                .frame(height: 0.3)
                                .overlay(.secondary)
                            
                            Image(systemName: "info.circle.fill")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                            
                            Text(menuItem.description)
                                .multilineTextAlignment(.center)
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        
                        
                        Link(destination: URL(string: "https://github.com/GunGaX")!) {
                            HStack {
                                Image(systemName: "link")
                                    .bold()
                                
                                Text("Read more")
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .padding(.horizontal, -65)
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    
                    
                    .padding(.horizontal, 8)
                    .padding(.vertical, 18)
                    .background(Color("backgroundColor"), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                }
                .shadow(color: Color.black.opacity(0.2), radius: 50, x: 0, y:1)
                .padding()
                .navigationTitle(menuItem.title)
            }
        }
    }
}






struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel().foods
        MenuItemDetailsView(menuItem: viewModel[1])
    }
}
