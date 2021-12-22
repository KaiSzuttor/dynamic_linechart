import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtCharts 2.0

import Generators

ChartView {
    title: "Line"
    antialiasing: true
    anchors.fill: parent

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

