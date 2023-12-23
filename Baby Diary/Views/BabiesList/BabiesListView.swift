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
            List(babiesListViewModel.babies, id: \.id, selection: $selection) { baby in
                NavigationLink(baby.name.firstName, value: baby)
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
    viewModel.babies = [Baby(id: UUID(), name: Name(firstName: "Savannah", lastName: "Ching"))]
    return BabiesListView(babiesListViewModel: viewModel)
}
