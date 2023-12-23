//
//  CategoryButtonView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import SwiftUI

struct CategoryButtonView: View {
    
    var category: Category
    var action: () -> ()
    
    var body: some View {
        Button(category.rawValue) {
            action()
        }
//        .buttonStyle(CategoryButtonStyle())
    }
}

#Preview {
    CategoryButtonView(category: Category.feed, action: {
        print("Hello")
    })
}

//struct CategoryButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(.vertical, 8)
//            .padding(.horizontal)
//            .background(.pink)
//            .foregroundStyle(.white)
//            .cornerRadius(20)
//    }
//}
