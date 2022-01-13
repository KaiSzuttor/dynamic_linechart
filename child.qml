import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtCharts 2.0

import Generators

ChartView {
    antialiasing: true
    height: 240
    width: 360
    margins.bottom: 0
    margins.top: 0
    margins.left: 0
    margins.right: 0

    ValueAxis {
        id: axisX
        min: 0
        max: 100
        tickCount: 0
    }

    LineSeries {
        name: "Data from python"
        id: line_series
        axisX: axisX
    }

    DataGenerator {
        id: dataGenerator
    }

    Connections {
        target: dataGenerator
        function onNewData(y) {
            if (line_series.count > 100) {
              line_series.clear();
            }
            line_series.axisY.min = Math.min(y, line_series.axisY.min);
            line_series.axisY.max = Math.max(y, line_series.axisY.max);
            line_series.append(line_series.count,y);
        }
    }
}

