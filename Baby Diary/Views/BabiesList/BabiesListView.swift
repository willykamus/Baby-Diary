//
//  BabiesListView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import SwiftUI

struct BabiesListView: View {
    
    @StateObject var babiesListViewModel = BabiesListViewModel()
    @State private var selection: Baby? = nil
    
    var body: some View {
        NavigationSplitView {
            List($babiesListViewModel.babies, id: \.id, selection: $selection) { baby in
                NavigationLink {
                    BabyMainView()
                } label: {
                    Text(baby.name.wrappedValue.firstName)
                }
            }
        } detail: {
            if let baby = selection {
                Text("\(baby.name.firstName) \(baby.name.lastName)")
            } else {
                Text("Select a baby")
            }
        }
        
    }
}

#Preview {
    @State var viewModel = BabiesListViewModel()
    return BabiesListView(babiesListViewModel: viewModel)
}
