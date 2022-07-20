//
//  DateHandler.swift
//  LecMovie
//
//  Created by alexdamascena on 18/07/22.
//

import Foundation


class DateHandler {
    
    static let shared = DateHandler()
    private init(){}
    
    func getYear(of date: String) -> String {
        return String(date.prefix(4))
    }
}
