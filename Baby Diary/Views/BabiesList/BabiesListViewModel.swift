//
//  BabiesListViewModel.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import Foundation

class BabiesListViewModel: ObservableObject {
    @Published var babies: [Baby] = []
}
