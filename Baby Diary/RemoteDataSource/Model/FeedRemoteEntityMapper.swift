//
//  FeedRemoteEntityMapper.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

class FeedRemoteEntityMapper {
    func toEntity(remoteEntity: FeedRemoteEntity) -> Feed {
        return Feed(id: remoteEntity.id ?? "", method: FeedMethod(rawValue: remoteEntity.method) ?? .unowned, measurement: Measurement(value: remoteEntity.amount, unit: .milliliters), date: remoteEntity.date)
    }
    
    func toRemoteEntity(entity: Feed) -> FeedRemoteEntity {
        return FeedRemoteEntity(id: entity.id, method: entity.method.rawValue, amount: entity.measurement.value, unit: entity.measurement.unit.symbol, date: entity.date)
    }
}
