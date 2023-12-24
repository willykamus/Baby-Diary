//
//  FeedRemoteDataSource.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-21.
//

import Foundation

protocol FeedRemoteDataSource {
    func add(id: String, feeds: [any Feed]) async -> Bool
}
