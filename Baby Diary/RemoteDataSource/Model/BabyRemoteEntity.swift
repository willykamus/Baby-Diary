//
//  BabyRemoteEntity.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation
import FirebaseFirestore

struct BabyRemoteEntity: Codable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var feeds: [FeedRemoteEntity]?
}
