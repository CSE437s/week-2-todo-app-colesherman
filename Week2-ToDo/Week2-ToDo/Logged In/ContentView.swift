//
//  ContentView.swift
//  Week2-ToDo
//
//  Created by Cole Sherman on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = TasksViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                // hstack, progress circle and vstack of "hello, name" and tasks done/completed
                HStack {
                    CircularProgressView(progress: Double(viewModel.completedTasks.count) / Double(viewModel.toDo.count))
                        .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    VStack {
                        Text("Hello, \(viewModel.username)!")
                            .foregroundColor(.black)
                        Text("\(viewModel.toDo.count) tasks to do, \(viewModel.completedTasks.count) tasks completed")
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                }
                .padding()
                
                
                List(viewModel.toDo, id: \.self) { task in
                    Text(task)
                }
                
                //create task button
                NavigationLink {
                    CreateTask()
                } label: {
                    Text("Create Task")
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color.green).cornerRadius(10).foregroundColor(.white).frame(minWidth: UIScreen.main.bounds.width - 100)
                }
            }
            .padding()

        }
        .onAppear {
            viewModel.refreshLists()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
