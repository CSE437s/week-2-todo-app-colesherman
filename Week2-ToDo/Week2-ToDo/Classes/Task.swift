//
//  Task.swift
//  Week2-ToDo
//
//  Created by Cole Sherman on 1/23/24.
//

import Foundation

struct Task: Identifiable {
    
    //will be used once barebones functionality works
    
    var id: UUID
    
    
    var taskName: String
    var taskDescription: String?
    var isDone: Bool
    
    var subtasks: [String]?
    
}
