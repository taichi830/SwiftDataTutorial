//
//  Friend.swift
//  SwiftDataTutorial
//
//  Created by fukuda taichiro on 2024/04/28.
//

import Foundation
import SwiftData

@Model
class Friend {
    let name: String
    let birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
