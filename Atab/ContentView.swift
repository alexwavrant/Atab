//
//  ContentView.swift
//  Atab
//
//  Created by Alexandre Wavrant on 02/06/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var testHabit = Habit(name: "Running")
    
    @StateObject var listOfHabits : HabitsList = HabitsList()
        
    let layout = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Not yet completed")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(listOfHabits.list, id: \.self) { item in
                            if (item.accomplishedToday == false) {
                                HabitCard(habit: item)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    Text("Completed")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                        .padding(.top)
                    
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(listOfHabits.list, id: \.self) { item in
                            if (item.accomplishedToday == true) {
                                HabitCard(habit: item)
                            }
                        }
                    }
                }
                
            }
            .padding(.top, 20)
            
            .navigationBarTitle("Your Habits")
            .navigationBarItems(trailing: NavigationLink("Add a habit", destination: AddHabitView().environmentObject(listOfHabits)))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
