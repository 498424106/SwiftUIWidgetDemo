//
//  ZSWidget.swift
//  ZSWidget
//
//  Created by zs on 2024/10/30.
//

import WidgetKit
import SwiftUI

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), animal: .lion)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), animal: .lion)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping @Sendable (Timeline<SimpleEntry>) -> Void) {
        let currentDate = Date()
        
        guard let id = configuration.animal?.identifier, let entryDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate) else {
            let timeLine = Timeline(entries: [SimpleEntry(date: currentDate, animal: .lion)], policy: .atEnd)
            completion(timeLine)
            return
        }
        
        let entry = SimpleEntry(date: entryDate, configuration: configuration, animal: AnimalModel.animal(id))
        
        
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var configuration: ConfigurationIntent? = nil

    let animal: AnimalModel
    
    var bgColor:Color{
        if let colorChoice = configuration?.bgColor{
            switch colorChoice{
            case .red:
                return Color.red
            case .yellow:
                return Color.yellow
            case .green:
                return Color.green
            default:
                return Color.white
            }
        }
        return Color.white
    }
}

struct ZSWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family//上下文获取小组件的类型

    var body: some View {
        VStack {
            switch family {
            case .systemSmall:  // 小号
                VStack {
                    Spacer()
                    Text(entry.animal.avatar)
                        .font(.largeTitle)
                    Text(entry.animal.name)
                    
                    Text("这是颜色")
                        .background(entry.bgColor)
                    Spacer()
                }
            case .systemMedium: // 中号
                Text(entry.date, style: .time)
            case .systemLarge:  // 大号
                Text(entry.date, style: .time)
            case .systemExtraLarge:
                Text(entry.date, style: .time)
            case .accessoryCircular:
                Text(entry.date, style: .time)
            case .accessoryRectangular:
                Text(entry.date, style: .time)
            case .accessoryInline:
                Text(entry.date, style: .time)
            @unknown default:
                Text(entry.date, style: .time)
            }            
        }
    }
}

struct ZSWidget: Widget {
    let kind: String = "ZSWidget"

    var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ZSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .accessoryRectangular, .accessoryCircular, .accessoryInline])
        .contentMarginsDisabled()
        
    }
}


