//
//  BabyRemoteDataSource.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

protocol BabyRemoteDataSource {
    func get() async -> [Baby]
    func get(id: String) async -> Baby
}

