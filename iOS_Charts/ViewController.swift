//
//  ViewController.swift
//  iOS_Charts
//
//  Created by 中山 陽介 on 12/29/15.
//  Copyright © 2015 Yosuke Nakayama. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    var months: [String]!
    

    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        barChartView.noDataText = "there is no data"
        barChartView.noDataTextDescription = "give me the reason"
        self.months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(months, values: unitsSold)
    }
    

    func setChart(dataPoints: [String], values: [Double]) {
//        barChartView.noDataText = "You need to provide data for the chart."
        

        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

