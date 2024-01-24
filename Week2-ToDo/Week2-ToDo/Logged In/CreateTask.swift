//
//  CreateTask.swift
//  Week2-ToDo
//
//  Created by Cole Sherman on 1/23/24.
//

import SwiftUI

struct CreateTask: View {
    
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack{
                HStack {
                    TextField("Task Name (required)", text: $taskName)
                }.modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .white, textColor: .cyan)).frame(width: UIScreen.main.bounds.width - 50)
            }

            Button("Create Task", action: {
                if taskName.isEmpty {
                    return
                } else {
                    let defaults = UserDefaults.standard
                    var taskArray = defaults.array(forKey: "ToDo") as? [String] ?? [String]()
                    taskArray.append(taskName)
                    defaults.removeObject(forKey: "ToDo")
                    defaults.set(taskArray, forKey: "ToDo")
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
            .padding()
            .frame(width: UIScreen.main.bounds.width - 100)
            .background(Color.cyan).cornerRadius(10).foregroundColor(.white).frame(minWidth: UIScreen.main.bounds.width - 100)

            
        }
        
    }
}

struct CreateTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateTask()
    }
}
