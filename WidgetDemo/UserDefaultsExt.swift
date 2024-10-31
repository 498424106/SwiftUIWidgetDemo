//
//  UserDefaultsExt.swift
//  WidgetDemo
//
//  Created by zs on 2024/10/30.
//

import Foundation

let groupId = "group.com.yourgroupid.test"
let appArrGroupKey = "appArrGroupKey"

extension UserDefaults {
    static var appGroup: UserDefaults = UserDefaults(suiteName: groupId)!
    
    static var shareURL: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupId)!
}

extension UserDefaults {
    static var AnimalModelArr: [AnimalModel] {
        get {
            var shareURL = Self.shareURL
            shareURL.appendPathComponent(appArrGroupKey)
            
            guard let data = try? Data(contentsOf: shareURL) else { return [] }
            return (try? JSONDecoder().decode([AnimalModel].self, from: data)) ?? []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            
            var shareURL = Self.shareURL
            shareURL.appendPathComponent(appArrGroupKey)
            
            try? data?.write(to: shareURL)
        }
    }
}
