//
//  File.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import Foundation

struct Feed: Hashable, Identifiable {
    var id: String
    var method: FeedMethod
    var measurement: Measurement<UnitVolume>
    var date: Date
}

enum FeedMethod: String, CodingKey, CaseIterable {
    case breastfeeding = "Breastfeeding"
    case breastMilkBottle = "Bottle with breast milk"
    case formula = "Formula"
    case unowned
}


