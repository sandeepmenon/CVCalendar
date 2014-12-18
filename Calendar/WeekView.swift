//
//  WeekView.swift
//  Calendar
//
//  Created by E. Mozharovsky on 12/15/14.
//  Copyright (c) 2014 GameApp. All rights reserved.
//

import UIKit

class WeekView: UIView {
    let index: Int?
    let monthView: MonthView?
    var days: [DayView]?
    
    lazy var calendarViewData: CalendarViewData = {
        return self.monthView!.calendarViewData
    }()
    
    init(monthView: MonthView, index: Int) {
        super.init()
        
        self.monthView = monthView
        self.index = index
        self.makeDayViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.makeDayViews()
    }

    // MARK: - Day View build
    
    func makeDayViews() {
        println("Creating days...")
        
        self.days = [DayView]()
        for i in 0..<7 {
            let day = DayView(weekView: self, frame: self.dayViewFrame(i), index: i, date: NSDate())
            self.days?.append(day)
            self.addSubview(day)
        }
    }
    
    func dayViewFrame(i: Int) -> CGRect {
        let width = CGFloat(self.calendarViewData.dayViewWidth!)
        let space = CGFloat(self.calendarViewData.horizontalSpaceBetweenDayViews!)
        
        let weekViewHeight = CGFloat(self.calendarViewData.weekViewHeight!)
        let symbolHeight = CGFloat(self.calendarViewData.symbolsHeight!)
        
        var y: CGFloat = 0
        var x: CGFloat = 0
        var height: CGFloat = 0
        
        if self.index == 0 {
            x = (CGFloat(i) * (width + space)) + space/2
            height = symbolHeight
        } else {
            x = (CGFloat(i) * (width + space)) + space/2
            height = weekViewHeight
        }
        
        return CGRectMake(x, 0, width, height)
    }
    

}