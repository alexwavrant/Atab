//
//  AddItemView.swift
//  Atab
//
//  Created by Alexandre Wavrant on 04/06/2021.
//

import SwiftUI

struct AddHabitView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var habitNameInput : String = ""
    
    @EnvironmentObject var listOfHabits : HabitsList
        
    var body: some View {
        NavigationView {
            VStack.init(alignment: .center) {                
                Text("Habit name")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                
                TextField("Type the name of your habit here", text: $habitNameInput)
                    .padding(.top, 5)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                        listOfHabits.list.append(Habit(name: habitNameInput))
                        self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add New Habit")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.purple, .blue, .green]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(40)
                }
                .padding(.top, 30)
                .shadow(radius: 5)
            }
        }
        
    }
    
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
