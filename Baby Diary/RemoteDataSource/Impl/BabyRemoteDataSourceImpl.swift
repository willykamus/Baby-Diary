//
//  BabyRemoteDataSourceImpl.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class BabyRemoteDataSourceImpl: BabyRemoteDataSource {
    
    let database = Firestore.firestore()
    
    func get() async -> [Baby] {
        do {
            let remoteEntities = try await database.collection("Baby").getDocuments()
            var babies: [Baby] = []
            for document in remoteEntities.documents {
                let babyRemoteEntity = try document.data(as: BabyRemoteEntity.self)
                let feeds = await self.getFeeds(from: document)
                var baby = BabyRemoteEntityMapper().toEntity(remoteEntity: babyRemoteEntity)
                baby.feeds = feeds
                babies.append(baby)
            }
            return babies
        } catch {
            print("Error decoding baby: \(error)")
            return []
        }
    }
    
    func get(id: String) async -> Baby {
        return Baby(id: "", name: Name(firstName: "", lastName: ""), dateOfBirth: Date(), feeds: [])
    }
    
    private func getFeeds(from document: DocumentSnapshot) async -> [Feed] {
        do {
            var feeds: [Feed] = []
            let query = try await document.reference.collection("feeds").getDocuments()
            for document in query.documents {
                let feedRemoteEntity = try document.data(as: FeedRemoteEntity.self)
                let feed = FeedRemoteEntityMapper().toEntity(remoteEntity: feedRemoteEntity)
                feeds.append(feed)
            }
            return feeds
        } catch {
            print("Error decoding feeds: \(error)")
            return []
        }
        
    }
    
}
