//
//  FeedFormViewModel.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-20.
//

import Foundation

class FeedFormViewModel: ObservableObject {
    @Published var amount: String = ""
    @Published var method: FeedMethod = .breastfeeding
    @Published var unit: UnitVolume = .milliliters
    @Published var date: Date = Date()
    
    private let saveFeedInteractor: SaveFeedInteractor = SaveFeedInteractorImpl()
    
    func save(id: String) async -> Bool {
        if !amount.isEmpty {
            let feed = Feed(id: UUID().uuidString, method: method, measurement: Measurement(value: Double(amount) ?? 0, unit: .milliliters), date: date)
            return await saveFeedInteractor.execute(id: id, feeds: [feed])
        } else {
            return false
        }
    }
}
