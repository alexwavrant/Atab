//
//  HabitsList.swift
//  Atab
//
//  Created by Alexandre Wavrant on 04/06/2021.
//

import Foundation

class HabitsList: ObservableObject {
    @Published var list : [Habit] = [Habit(name: "Running"), Habit(name: "Read a book")]
}
