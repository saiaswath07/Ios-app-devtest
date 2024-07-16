
import Foundation

import SwiftUI
import Charts

struct ChartView: View {
    var data: [Double]
    
    var body: some View {
        Chart {
            ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("Hour", index),
                    y: .value("Clicks", value)
                )
            }
                .lineStyle(StrokeStyle(lineWidth: 1))

                .lineStyle(StrokeStyle(lineWidth: 1))
        }
        .chartXAxis {
            AxisMarks(values: .stride (by: 1))
        }
        .chartYAxis {
            AxisMarks(position: .leading, values: .stride(by: 1))
        }
        .frame(height: 200)
    }
}
