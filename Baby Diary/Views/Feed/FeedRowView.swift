//
//  FeedRowView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-18.
//

import SwiftUI

struct FeedRowView: View {
    
    @Binding var feed: any Feed
    
    var body: some View {
        if let feed = self.feed as? Bottle {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Bottle with \(feed.content.rawValue)")
                    Text(getTimeOfDay(date:feed.date))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(formater().string(from: feed.measurement))
            }
        }
        
    }
    
    private func formater() -> MeasurementFormatter {
        let formater = MeasurementFormatter()
        formater.unitStyle = .short
        formater.unitOptions = .providedUnit
        return formater
    }
    
    private func getTimeOfDay(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    FeedRowView(feed: .constant(Bottle(id: "", date: Date(), content: .breastMilk, measurement: Measurement(value: 0, unit: .milliliters))))
}
