//
//  TaskView.swift
//  ToDo-List
//
//  Created by Saba Gogrichiani on 08.12.23.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var todo: Task
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 16, height: 80)
                .background(todo.color)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(todo.taskName)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "calendar")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text(todo.date)
                            .font(.system(size: 14))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                
                Spacer()
                
                Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                    .symbolRenderingMode(todo.isDone ? .palette : .none)
                    .foregroundStyle(todo.isDone ? .black : Color(red: 188/255, green: 131/255, blue: 222/255), Color(red: 188/255, green: 131/255, blue: 222/255))
                    .font(.system(size: 25))
                    .onTapGesture {
                        todo.isDone.toggle()
                    }
            }
            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 10))
            .foregroundStyle(.clear)
            .frame(height: 80)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        }
        .frame(height: 80)
        .cornerRadius(8)
    }
}

#Preview() {
    TaskView(todo: .constant(tasks[0]))
}
