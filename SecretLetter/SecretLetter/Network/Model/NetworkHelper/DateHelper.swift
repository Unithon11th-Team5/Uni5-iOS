//
//  DateHelper.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct DateHelper {
    
    static let shared = DateHelper()
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    func stringToDate(dateString: String) -> Date? {
        return dateFormatter.date(from: dateString)
    }
    
    func dateToString(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
