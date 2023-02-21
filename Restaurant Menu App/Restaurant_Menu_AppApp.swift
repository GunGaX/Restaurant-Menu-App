//
//  Restaurant_Menu_AppApp.swift
//  Restaurant Menu App
//
//  Created by Dmytro Savka on 18.02.2023.
//

import SwiftUI

@main
struct Restaurant_Menu_AppApp: App {
    
    @AppStorage("colorScheme") var colorScheme: Bool = true
    
    var body: some Scene {
        WindowGroup {
            MenuItemsView()
                .preferredColorScheme(colorScheme ? .light: .dark)
        }
    }
}
