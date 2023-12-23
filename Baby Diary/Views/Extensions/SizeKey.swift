//
//  SizeKey.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-20.
//

import SwiftUI

struct SizeKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func heightChangePreference(completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay {
                GeometryReader(content: { geometry in
                    Color.clear
                        .preference(key: SizeKey.self, value: geometry.size.height)
                        .onPreferenceChange(SizeKey.self, perform: { value in
                            completion(value)
                        })
                })
            }
    }
}
