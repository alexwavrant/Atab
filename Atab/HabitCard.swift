//
//  HabitCard.swift
//  Atab
//
//  Created by Alexandre Wavrant on 02/06/2021.
//

import SwiftUI

struct HabitCard: View {
    @StateObject var habit : Habit
    
    @State private var circleColor = Color.gray
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .frame(width: 170, height: 240, alignment: .center)
            .foregroundColor(.white)
            .shadow(radius: 5)
            .overlay(
                VStack() {
                    Circle()
                        .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .colorMultiply(self.circleColor)
                        .overlay(Text(String(habit.currentStreak))
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white))
                        .padding(.top)

                    HStack {
                        VStack(alignment: .leading) {
                            Text(habit.nameOfTheHabit)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)

                            HStack(spacing: 2) {
                                Text("Longest streak: ")
                                Text(String(habit.longestStreak))
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                            Button(action: {
                                habit.accomplishTask()
                                withAnimation(.easeInOut(duration: 1)) {
                                    circleColor = Color.green
                                }
                            }) {
                                HStack {
                                    Text("Done")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .background(habit.accomplishedToday == true ? Color.gray : Color.green)
                                .cornerRadius(40)
                            }
                            .padding(.top, 10)
                            .disabled(habit.accomplishedToday)

                        }
                        .layoutPriority(100)

                    }
                    .padding()
                }
                .frame(width: 170, height: 240)
                .cornerRadius(10)
            )
    }
}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: Habit(name: "Read a book"))
    }
}

