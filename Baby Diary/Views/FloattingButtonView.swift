//
//  FloattingButtonView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import SwiftUI

struct FloattingButtonView: View {
    
    var action: () -> ()
    
    var body: some View {
            Button(action: {
                action()
            }, label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.pink)
                    .clipShape(Circle())
            })
        
    }
}

#Preview {
    FloattingButtonView(action: {})
}
