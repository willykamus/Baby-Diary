//
//  BabyInitialsView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import SwiftUI

struct BabyInitialsView: View {
    
    var name: Name
    
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .overlay {
                Text(name.initialis())
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

            }
    }
}

#Preview {
    BabyInitialsView(name: Name(firstName: "Savannah", lastName: "Ching"))
}
