//
//  BabyRemoteEntityMapper.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

class BabyRemoteEntityMapper {
    func toEntity(remoteEntity: BabyRemoteEntity) -> Baby {
        return Baby(id: remoteEntity.id ?? "", name: Name(firstName: remoteEntity.firstName, lastName: remoteEntity.lastName), dateOfBirth: remoteEntity.dateOfBirth, feeds: [])
    }
}
