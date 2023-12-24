//
//  FeedRemoteEntityMapper.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

class FeedRemoteEntityMapper {
    func toEntity(remoteEntity: FeedRemoteEntity) -> any Feed {
        let method = FeedMethod(rawValue: remoteEntity.method) ?? .unowned
        switch method {
        case .breastMilkBottle:
            return Bottle(id: remoteEntity.id ?? "", date: remoteEntity.date, content: .breastMilk, measurement: Measurement(value: remoteEntity.amount, unit: .milliliters))
        case .breastfeeding:
            return Breastfeeding(id: remoteEntity.id ?? "", date: remoteEntity.date, start: Date(), end: Date())
        case .formula:
            return Bottle(id: remoteEntity.id ?? "", date: remoteEntity.date, content: .formula, measurement: Measurement(value: remoteEntity.amount, unit: .milliliters))
        case .unowned:
            return Bottle(id: "", date: Date(), content: BottleContent.breastMilk, measurement: Measurement(value: 0, unit: .milliliters))
        }
    }
    
    func toRemoteEntity(entity: any Feed) -> FeedRemoteEntity {
        switch entity {
        case let bottle as Bottle:
            return bottle.content == .breastMilk ? FeedRemoteEntity(id: bottle.id, method: FeedMethod.breastMilkBottle.rawValue, amount: bottle.measurement.value, unit: bottle.measurement.unit.symbol, date: bottle.date) : FeedRemoteEntity(id: bottle.id, method: FeedMethod.formula.rawValue, amount: bottle.measurement.value, unit: bottle.measurement.unit.symbol, date: bottle.date)
        case let breastfeeding as Breastfeeding:
            return FeedRemoteEntity(id: breastfeeding.id, method: "", amount: 0, unit: "", date: Date())
        default:
            return FeedRemoteEntity(id: "", method: "", amount: 0, unit: "", date: Date())
        }
    }
}
