//
//  FeedRemoteEntity.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation
import FirebaseFirestore

struct FeedRemoteEntity: Codable {
    @DocumentID public var id: String!
    var method: String
    var amount: Double
    var unit: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case method
        case amount
        case unit
        case date
    }
    
}
