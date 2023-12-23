//
//  GetBabiesInteractor.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

protocol GetBabiesInteractor {
    func execute() async -> [Baby]
}
