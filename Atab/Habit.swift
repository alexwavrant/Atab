//
//  Habit.swift
//  Atab
//
//  Created by Alexandre Wavrant on 02/06/2021.
//

import Foundation
import SwiftUI

class Habit: ObservableObject, Hashable {
    
    // THis function is used to conform to the Equatable protocol
    static func == (lhs: Habit, rhs: Habit) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    // Because Habit is an external class, we implement the ObservableObject protocol
    // Everytime a @Published variale is updated, the view using it is going to reload with the new value
    @Published var nameOfTheHabit = ""
    @Published var currentStreak = 0
    @Published var longestStreak = 0
    @Published var accomplishedToday = false
    
    let uuid = UUID().uuidString // Used to conform to the Hashable and Equatable protocol
    
    init(name: String) {
        self.nameOfTheHabit = name
    }
    
    // When a habit has been accomplished (when the "Done" button is pressed),
    // this function is called: it increments the current streak and
    // set the boolean to accomplishedToday to true
    func accomplishTask() {
        incrementCurrentStreak()
        accomplishedToday = true
    }
    
    // Increment the current streak of the user and checks if the current streak is the longest of the user.
    func incrementCurrentStreak() {
        currentStreak += 1
        checkIfLongestStreak()
    }
    
    func checkIfLongestStreak() {
        if currentStreak > longestStreak {
            longestStreak = currentStreak
        }
    }
    
    func resetCurrentStreak() {
        currentStreak = 0
    }
    
}
