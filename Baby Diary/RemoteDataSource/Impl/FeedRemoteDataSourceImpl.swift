//
//  FeedRemoteDataSourceImpl.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FeedRemoteDataSourceImpl: FeedRemoteDataSource {
    
    let database = Firestore.firestore()
    
    func add(id: String, feeds: [Feed]) async -> Bool {
        do {
            for feed in feeds {
                let remoteEntity = FeedRemoteEntityMapper().toRemoteEntity(entity: feed)
                try database.collection("Baby").document(id).collection("feeds").addDocument(from: remoteEntity)
            }
            return true
        } catch {
            print("Error writing feed to Firestore: \(error)")
            return false
        }
    }
}
