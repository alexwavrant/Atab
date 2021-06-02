//
//  Habit.swift
//  Atab
//
//  Created by Alexandre Wavrant on 02/06/2021.
//

import Foundation

class Habit {
    var nameOfTheHabit: String
    var currentStreak = 0
    var longestStreak = 0
    
    init(name: String) {
        nameOfTheHabit = name
    }
    
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
