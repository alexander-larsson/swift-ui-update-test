//
//  ContentView.swift
//  SwiftUIUpdateTest
//
//  Created by Alexander Larsson on 2021-02-09.
//

import SwiftUI

let formatter: RelativeDateTimeFormatter = {
    let formatter = RelativeDateTimeFormatter()
    formatter.dateTimeStyle = .numeric
    return formatter
}()

let now = Date(timeIntervalSinceNow: 59)

struct ContentView: View {
    @State var count = 0

    var body: some View {
        return VStack {
            Button("Count") {
                count += 1
            }

            DateChildView(date: now)
                .padding()
                .background(Color.orange)
                .id(UUID().uuidString)

            DateChildView(date: now)
                .padding()
                .background(Color.yellow)

            Text("\(count)")
                .padding()
                .background(Color.green)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DateChildView: View {
    let date: Date

    var body: some View {
        return Text(formatter.string(for: date)!)
    }
}
