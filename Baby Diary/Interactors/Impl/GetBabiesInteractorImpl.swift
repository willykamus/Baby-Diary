//
//  GetBabiesInteractorImpl.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

class GetBabiesInteractorImpl: GetBabiesInteractor {
    
    var remoteDataSource: BabyRemoteDataSource = BabyRemoteDataSourceImpl()
    
    func execute() async -> [Baby] {
        return await remoteDataSource.get()
    }
    
    
}
