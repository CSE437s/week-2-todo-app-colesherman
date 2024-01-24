//
//  Week2_ToDoApp.swift
//  Week2-ToDo
//
//  Created by Cole Sherman on 1/23/24.
//

import SwiftUI

@main
struct Week2_ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            let defaults = UserDefaults.standard
            if defaults.string(forKey: "Username") == nil  {
                RegisterName()
            } else {
                ContentView()
            }
        }
    }
}
