//
//  ContentView.swift
//  Atab
//
//  Created by Alexandre Wavrant on 02/06/2021.
//

import SwiftUI

struct ContentView: View {
    var testHabit = Habit(name: "Running", emoji: "🏃🏻‍♂️")
    
    @StateObject var listOfHabits : HabitsList = HabitsList()
        
    let layout = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(listOfHabits.list, id: \.self) { item in
                        HabitCard(habit: item)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.top, 30)
            }
            
            .navigationBarTitle("Your Habits")
            .navigationBarItems(trailing: NavigationLink("Add a habit", destination: AddItemView().environmentObject(listOfHabits)))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
