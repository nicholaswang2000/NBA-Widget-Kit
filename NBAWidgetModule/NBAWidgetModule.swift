//
//  NBAWidgetModule.swift
//  NBAWidgetModule
//
//  Created by Nicholas Wang on 2021-01-11.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), myString: "...")
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, myString: "...")
        completion(entry)
    }

    // main logic
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, myString: DataProvider.getUserDefaultString())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let myString: String
}

// widget look
struct NBAWidgetModuleEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text(entry.myString).foregroundColor(.orange).fontWeight(.light).multilineTextAlignment(.center)
        }
    }
}

@main
struct NBAWidgetModule: Widget {
    let kind: String = "NBAWidgetModule"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            NBAWidgetModuleEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct NBAWidgetModule_Previews: PreviewProvider {
    static var previews: some View {
        NBAWidgetModuleEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), myString: "Random String"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
