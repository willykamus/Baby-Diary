//
//  FeedFormView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import SwiftUI

struct FeedFormView: View {
    
    var babyId: String
    @Binding var isPresented: Bool
    @StateObject var feedFormViewModel: FeedFormViewModel = FeedFormViewModel()
    
    var body: some View {
        VStack(spacing: 8) {
            LabeledContent {
                TextField(text: $feedFormViewModel.amount) {
                    EmptyView()
                }
                .font(.callout)
                .multilineTextAlignment(.trailing)
            } label: {
                Text("Amount")
                    .font(.callout)
            }
            
            Divider()
            
            LabeledContent {
                Picker("Unit", selection: $feedFormViewModel.unit) {
                    Text(UnitVolume.milliliters.symbol)
                        .font(.callout)
                        .tag(UnitVolume.milliliters)
                    Text(UnitVolume.fluidOunces.symbol)
                        .font(.callout)
                        .tag(UnitVolume.fluidOunces)
                }
                .tint(.gray)
                .padding(.trailing, -12)
            } label: {
                Text("Unit")
                    .font(.callout)
            }
            
            Divider()
            
            LabeledContent {
                Picker("Method", selection: $feedFormViewModel.method) {
                    ForEach(FeedMethod.allCases, id: \.self) { method in
                        if method == .unowned {
                            EmptyView()
                        } else {
                            Text(method.rawValue).tag(method.rawValue)
                        }
                    }
                }
                .tint(.gray)
                .padding(.trailing, -12)
            } label: {
                Text("Method")
                    .font(.callout)
            }
            
            Divider()
            
            DatePicker(selection: $feedFormViewModel.date, in: ...Date()) {
                Text("Date")
                    .font(.callout)
            }
            
            Divider()
            
            Button("Save") {
                Task {
                    self.isPresented = await !feedFormViewModel.save(id: self.babyId)
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)

        }
    }
}

#Preview {
    FeedFormView(babyId: "", isPresented: .constant(true), feedFormViewModel: FeedFormViewModel())
}
