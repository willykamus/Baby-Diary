//
//  File.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import Foundation

struct Breastfeeding: Feed, Identifiable {
    var id: String
    var date: Date
    var start: Date
    var end: Date
}

struct Bottle: Feed, Identifiable {
    var id: String
    var date: Date
    var content: BottleContent
    var measurement: Measurement<UnitVolume>
}

enum BottleContent: String {
    case breastMilk = "Breast Milk"
    case formula = "Formula"
}

protocol Feed {
    var id: String { get set }
    var date: Date { get set }
}

enum FeedMethod: String, CaseIterable {
    case breastfeeding
    case breastMilkBottle
    case formula
    case unowned
}


