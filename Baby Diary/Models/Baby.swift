//
//  Baby.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import Foundation

struct Baby: Identifiable, Hashable {
    var id: String
    var name: Name
    var dateOfBirth: Date
    var feeds: [Feed]
}
