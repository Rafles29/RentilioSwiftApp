//
//  TimeFromDate.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

extension Date {
    
    init(from dateString: String, using dateFormat: String) {
        self.init()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from: dateString) else { return }
        self = date
    }
    
    func getTime() -> String {
        let calendar = Calendar.current
        let time = calendar.dateComponents([.hour,.minute], from: self)
        return "\(time.hour!):\(time.minute!)"
    }
    
    func getDate() -> String {
        let calendar = Calendar.current
        let time = calendar.dateComponents([.year,.month, .day], from: self)
        return "\(time.year!).\(time.month!).\(time.day!)"
    }
}
