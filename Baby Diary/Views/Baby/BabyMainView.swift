//
//  BabyMainView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-17.
//

import SwiftUI

struct BabyMainView: View {
    
    @State var selectedCategory: Category?
    @StateObject var babyMainViewModel: BabyMainViewModel = BabyMainViewModel()
    @State var presentSheet: Bool = false
    @State private var sheetHeight: CGFloat = .zero
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        BabyInitialsView(name: babyMainViewModel.baby.name)
                        Text(babyMainViewModel.baby.name.firstName)
                            .font(.system(size: 20))
                            
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(Category.allCases, id: \.rawValue) { category in
                                CategoryButtonView(category: category, action: {
                                    self.selectedCategory = category
                                })
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                
                ScrollView(.horizontal) {
                    LazyHStack {
//                        List {
//                            Section(header: Text("Important tasks").backgroundStyle(.white)) {
//                                ForEach($babyMainViewModel.baby.feeds) { feed in
//                                    FeedRowView(feed: feed)
//                                        .listRowInsets(EdgeInsets())
//                                        .padding(12)
//                                }
//                            }
//                            
//                        }
//                        .listStyle(.plain)
//                        .background(.white)
//                        .containerRelativeFrame(.horizontal)
                        
                        List {
                            ForEach(babyMainViewModel.feedSections, id: \.self) { feedSection in
                                Section {
                                    ForEach(feedSection.feeds, id: \.id) { feed in
                                        FeedRowView(feed: .constant(feed))
                                    }
                                } header: {
                                    HStack {
                                        Text(feedSection.title)
                                        Spacer()
                                        Text("Total: \(feedSection.total)")
                                    }
                                }
                            }
                        }
                        .background(.white)
                        .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollPosition(id: $selectedCategory)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                
            }
            .task {
                await babyMainViewModel.get()
            }
            .ignoresSafeArea(edges: .bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $presentSheet, onDismiss: {
                Task {
                    await self.babyMainViewModel.get()
                }
            }, content: {
                GeometryReader(content: { geometry in
                    HStack(spacing: 0) {
                        FeedFormView(babyId: babyMainViewModel.baby.id, isPresented: $presentSheet)
                            .padding(30)
                            .heightChangePreference { height in
                                sheetHeight = height
                            }
                    }
                    
                })
                .presentationCornerRadius(16)
                .presentationDetents(sheetHeight == .zero ? [.medium] : [.height(sheetHeight)])
            })
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloattingButtonView {
                        self.presentSheet.toggle()
                    }
                }
            }
            .padding(.bottom, 44)
            .padding(.trailing, 20)
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        

    }
}

#Preview {
    BabyMainView(babyMainViewModel: BabyMainViewModel())
}
