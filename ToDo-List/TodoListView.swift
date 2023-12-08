//
//  ContentView.swift
//  ToDo-List
//
//  Created by Saba Gogrichiani on 08.12.23.
//

import SwiftUI

struct TodoListView: View {
    
    @State var taskList = tasks
    
    // ამას viewModelში გავიტანდი
    private var uncompletedTaskCount: Int {
        return taskList.filter { !$0.isDone }.count
    }
    
    private func completeAllTasks() {
        for index in taskList.indices {
            taskList[index].isDone = true
        }
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 35) {
                HStack {
                    Text("You have \(uncompletedTaskCount) tasks to complete")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image("profilePic")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 20)
                                    .offset(y: 8)
                                Text("\(taskList.count - uncompletedTaskCount)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                    .offset(y:8)
                            },
                            alignment: .bottomTrailing
                        )
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button(action: {
                        completeAllTasks()
                    }, label: {
                        Text("Complete All")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 186/255, green: 131/255, blue: 222/255), Color(red: 222/255, green: 131/255, blue: 176/255)]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .cornerRadius(10)
                    })
                    
                    Text("Progress")
                        .foregroundStyle(.white)
                        .font(.system(size: 22))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Daily Task")
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("\(taskList.count - uncompletedTaskCount)/\(taskList.count) Task Completed")
                            .foregroundStyle(.white)
                            .font(.system(size: 16))
                            .opacity(0.8)
                        
                        VStack(spacing: 5) {
                            
                            HStack {
                                Text("Keep working")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .opacity(0.8)
                                
                                Spacer()
                                
                                Text("\(Int((Double(taskList.count - uncompletedTaskCount) / Double(taskList.count)) * 100))")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                            }
                            
                            ProgressBar(percent: CGFloat((Double(taskList.count - uncompletedTaskCount) / Double(taskList.count)) * 100))
                            
                        }
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 25, trailing: 15))
                    .frame(maxHeight: 140)
                    .background(Color(red: 24/255, green: 24/255, blue: 24/255))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Completed Tasks")
                        .foregroundStyle(.white)
                        .font(.system(size: 22))
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach($taskList) { $todo in
                                TaskView(todo: $todo)
                            }
                        }
                    }
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 26)
        }
    }
}

#Preview {
    TodoListView()
}


