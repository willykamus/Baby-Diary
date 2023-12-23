//
//  SaveFeedInteractorImpl.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-21.
//

import Foundation

class SaveFeedInteractorImpl: SaveFeedInteractor {
    
    private let feedRemoteDataSource: FeedRemoteDataSource = FeedRemoteDataSourceImpl()
    
    func execute(id: String, feeds: [Feed]) async -> Bool {
        return await feedRemoteDataSource.add(id: id, feeds: feeds)
    }
    
    
}
