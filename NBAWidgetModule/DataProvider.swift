//
//  DataProvider.swift
//  NBAWidgetKit
//
//  Created by Nicholas Wang on 2021-01-12.
//

import Foundation

class DataProvider {
    
    static func getRandomString() -> String {
        let strings = ["a", "b", "c", "d", "e"]
        return strings.randomElement()!
    }
    
    static func getUserDefaultString() -> String {
        return UserDefaults(suiteName: "group.com.nick.NBAWidgetKit")!.string(forKey: "test")!
    }
    
}
