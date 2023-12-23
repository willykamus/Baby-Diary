//
//  SaveFeedInteractor.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-21.
//

import Foundation

protocol SaveFeedInteractor {
    func execute(id: String, feeds: [Feed]) async -> Bool
}
