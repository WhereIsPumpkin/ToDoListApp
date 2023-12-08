//
//  TaskModel.swift
//  ToDo-List
//
//  Created by Saba Gogrichiani on 08.12.23.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var taskName: String
    var date: String
    var isDone: Bool
    var color: Color
}

let tasks = [
    Task(taskName: "Task 1", date: "4 Oct", isDone: true, color: Color(red: 0.84, green: 0.94, blue: 1)),
    Task(taskName: "Task 2", date: "4 Oct", isDone: false, color: Color(red: 0.98, green: 0.8, blue: 0.73)),
    Task(taskName: "Task 3", date: "5 Oct", isDone: true, color: Color(red: 0.84, green: 0.94, blue: 1)),
    Task(taskName: "Task 4", date: "5 Oct", isDone: false, color: Color(red: 0.98, green: 0.8, blue: 0.73))
]



