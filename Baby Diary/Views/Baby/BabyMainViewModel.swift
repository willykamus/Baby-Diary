//
//  BabyMainViewModel.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-19.
//

import Foundation

class BabyMainViewModel: ObservableObject {
    @Published var baby: Baby = Baby(id: "", name: Name(firstName: "", lastName: ""), dateOfBirth: Date(), feeds: [])
    @Published var feedSections: [FeedSection] = []
    var getBabiesInteractor: GetBabiesInteractor = GetBabiesInteractorImpl()
    
    func get() async {
        let babies = await getBabiesInteractor.execute()
        DispatchQueue.main.async {
            self.baby = babies.first!
            self.feedSections = self.sortByDate(feeds: self.baby.feeds)
        }
    }
    
    private func sortByDate(feeds: [any Feed]) -> [FeedSection] {
        let sections = Dictionary(grouping: feeds) { feed in
            Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: feed.date))!
        }
        let sorted = sections.sorted(by: { $0.key > $1.key})
        var displaySections: [FeedSection] = []
        for section in sorted {
            let feeds: [Bottle] = section.value.compactMap { $0 as? Bottle }
            let total = feeds.compactMap { bottle in
                    bottle.measurement.value
            }.reduce(0, +)
            displaySections.append(FeedSection(feeds: section.value, total: String(total), title: section.key.formatted(date: .abbreviated, time: .omitted)))
        }
        return displaySections
    }
    
}

struct FeedSection: Identifiable {
    var id: UUID = UUID()
    var feeds: [any Feed]
    var total: String
    var title: String
}
