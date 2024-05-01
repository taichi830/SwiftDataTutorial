//
//  Birthday.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/04/29.
//

import SwiftUI
import SwiftData

struct Birthday: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName: String = ""
    @State private var newDate: Date = Date.now
    
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
        }
        .safeAreaInset(edge: .bottom) {
            VStack(alignment: .center, spacing: 20) {
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                    TextField("Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                }
                Button("Save") {
                    let newFriend = Friend(name: newName, birthday: newDate)
                    context.insert(newFriend)
                    
                    newName = ""
                    newDate = .now
                }
                .bold()
            }
            .padding()
            .background(.bar)
        }
    }
}

#Preview {
    Birthday()
        .modelContainer(for: Friend.self, inMemory: true)
}
