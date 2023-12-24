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
            if method == .breastMilkBottle {
                let feed = Bottle(id: UUID().uuidString, date: date, content: .breastMilk, measurement: Measurement(value: Double(amount) ?? 0, unit: .milliliters))
                return await saveFeedInteractor.execute(id: id, feeds: [feed])
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
