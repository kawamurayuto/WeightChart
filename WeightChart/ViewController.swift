//
//  ViewController.swift
//  WeightChart
//
//  Created by 川村祐人 on 2015/10/01.
//  Copyright © 2015年 ever sense, Inc. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var barChartView: LineChartView!
    var months: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        _chartView.descriptionText = @"";
        _chartView.noDataTextDescription = @"You need to provide data for the chart.";
        
        _chartView.highlightEnabled = YES;
        _chartView.dragEnabled = YES;
        [_chartView setScaleEnabled:YES];
        _chartView.pinchZoomEnabled = NO;
        _chartView.drawGridBackgroundEnabled = NO;
        
        _chartView.xAxis.enabled = NO;
        _chartView.leftAxis.enabled = NO;
        _chartView.rightAxis.enabled = NO;
        _chartView.legend.enabled = NO;
        
        _sliderX.value = 44.0;
        _sliderY.value = 100.0;
        [self slidersValueChanged:nil];
        
        [_chartView animateWithXAxisDuration:2.0 yAxisDuration:2.0];
        */
        
        barChartView.delegate = self
        barChartView.descriptionText = ""
        barChartView.noDataTextDescription = "noDataTextDescription"
        barChartView.highlightEnabled = true
        barChartView.dragEnabled = true
        barChartView.setScaleEnabled(true)
        barChartView.pinchZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = false
        
        barChartView.xAxis.enabled = false
        barChartView.leftAxis.enabled = false
        barChartView.rightAxis.enabled = false
        barChartView.legend.enabled = false
        
        
        //scrollView.contentSize = CGSizeMake(barChartView.frame.width, barChartView.frame.height)
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [40.0, 42.0, 45.0, 43.0, 42.0, 49.0, 50.0, 53.0, 52.0, 54.0, 55.0, 54.0]
        
        setChart(months, values: unitsSold)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        
        /*
        chartDataSet.lineWidth = 2.0;
        chartDataSet.circleRadius = 5.0;
        chartDataSet.highlightColor = [UIColor colorWithRed:244/255.f green:117/255.f blue:117/255.f alpha:1.f];
        [set1 setColor:[UIColor colorWithRed:104/255.f green:241/255.f blue:175/255.f alpha:1.f]];
        chartDataSet.fillColor = [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f];
        chartDataSet.drawHorizontalHighlightIndicatorEnabled = NO;
        */
        let chartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        chartDataSet.drawCubicEnabled = true
        chartDataSet.cubicIntensity = 0.2
        chartDataSet.lineWidth = 2
        chartDataSet.circleRadius = 5
        chartDataSet.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        chartDataSet.setColor(UIColor(red: 104/255, green: 241/255, blue: 175/255, alpha: 1))
        chartDataSet.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
        chartDataSet.drawHorizontalHighlightIndicatorEnabled = false;
        
        
        let chartData = LineChartData(xVals: dataPoints, dataSet: chartDataSet)
        barChartView.data = chartData
        
        /*
        // 色のカスタマイズ
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        let chartData = BarChartData(xVals: dataPoints, dataSet: chartDataSet)

        barChartView.xAxis.labelPosition = .Bottom // 凡例の位置
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1) // 背景色
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0) // アニメーション
        
        let ll = ChartLimitLine(limit: 10.0, label: "Target") // ベースライン？
        barChartView.rightAxis.addLimitLine(ll)
*/
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        print("\(entry.value) in \(months[entry.xIndex])")
    }
}

