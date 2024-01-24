//
//  ContentViewModel.swift
//  Week2-ToDo
//
//  Created by Cole Sherman on 1/23/24.
//

import Foundation

extension ContentView {
    class TasksViewModel: ObservableObject {
        @Published var tasks: [String]
        @Published var completedTasks: [String]
        @Published var toDo: [String]
        @Published var username: String
        let defaults = UserDefaults.standard
        
        init()  {
            self.tasks = defaults.array(forKey: "TasksArray") as? [String] ?? [String]()
            self.completedTasks = defaults.array(forKey: "DoneTasks") as? [String] ?? [String]()
            self.toDo = defaults.array(forKey: "ToDo") as? [String] ?? [String]()
            self.username = defaults.string(forKey: "Username")!
        }
        
        func refreshLists() {
            self.tasks = defaults.array(forKey: "TasksArray") as? [String] ?? [String]()
            self.completedTasks = defaults.array(forKey: "DoneTasks") as? [String] ?? [String]()
            self.toDo = defaults.array(forKey: "ToDo") as? [String] ?? [String]()
        }
        
    }
}

