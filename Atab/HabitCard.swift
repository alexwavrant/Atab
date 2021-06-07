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
            .overlay(VStack(spacing: 30) {
                Text(habit.nameOfTheHabit)
//                    .font(.system(size: 18))
                    .font(.title2)
                    .fontWeight(.bold)
                    //.tracking(2.0) // Set space between letters
                    //.padding(.top, -40)
                    .foregroundColor(.black)
                
                Circle()
                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .colorMultiply(self.circleColor)
                    .overlay(Text(String(habit.currentStreak))
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                             
                    )
                
                
                Button(habit.associatedEmoji, action: {
                    habit.incrementCurrentStreak()
                    withAnimation(.easeInOut(duration: 1)) {
                        circleColor = Color.green
                    }
                })
                .font(.system(size: 20))

            })
        
        
        
    }
}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: Habit(name: "Read a book", emoji: "🏃🏻‍♂️"))
    }
}
