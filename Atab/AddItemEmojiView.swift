//
//  AddItemEmojiView.swift
//  Atab
//
//  Created by Alexandre Wavrant on 04/06/2021.
//

import SwiftUI

struct AddItemEmojiView: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var habitNameInput : String = ""
    @State private var habitEmojiInput : String = ""
    
    @EnvironmentObject var listOfHabits : HabitsList
    
    var body: some View {
        Text("ok")
//        NavigationView {
//            TextField("Type the emoji of your habit here", text: $habitEmojiInput)
//                .padding(.top, 5)
//                .foregroundColor(.gray)
//                .multilineTextAlignment(.center)
//                .navigationTitle("Add your habit")
//
//            Button(action: {
//                    listOfHabits.list.append(Habit(name: habitNameInput, emoji: habitEmojiInput))
//                    self.presentationMode.wrappedValue.dismiss()
//            }) {
//                HStack {
//                    Image(systemName: "plus")
//                    Text("Add New habit")
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                }
//                .padding()
//                .foregroundColor(.white)
//                .background(
//                    LinearGradient(gradient: Gradient(colors: [.purple, .blue, .green]), startPoint: .leading, endPoint: .trailing)
//                )
//                .cornerRadius(40)
//            }
//            .padding(.top, 50)
//            .shadow(radius: 5)
//        }
    }
}

struct AddItemEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemEmojiView()
    }
}
