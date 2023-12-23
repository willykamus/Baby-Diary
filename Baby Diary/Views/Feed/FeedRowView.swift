//
//  FeedRowView.swift
//  Baby Diary
//
//  Created by William Ching on 2023-12-18.
//

import SwiftUI

struct FeedRowView: View {
    
    @Binding var feed: Feed
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(feed.method.rawValue)
                Text(getTimeOfDay(date:feed.date))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(formater().string(from: feed.measurement))
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
    FeedRowView(feed: .constant(Feed(id: "", method: .breastfeeding, measurement: Measurement(value: 10, unit: .milliliters), date: Date())))
}
