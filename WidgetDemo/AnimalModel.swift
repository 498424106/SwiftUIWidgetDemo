//
//  AnimalModel.swift
//  WidgetDemo
//
//  Created by zs on 2024/10/29.
//

import Foundation

struct AnimalModel: Codable, Hashable {
    let id: String
    let name: String
    let avatar: String

    static let panda = AnimalModel(id: "panda", name: "panda", avatar: "🐼")
    static let lion = AnimalModel(id: "lion", name: "lion", avatar: "🦁️")
    static let tiger = AnimalModel(id: "tiger", name: "tiger", avatar: "🐯")
        
    static func animal(_ id: String) -> AnimalModel {
        var animal: AnimalModel
        switch id {
        case "panda":
            animal = .panda
        case "lion":
            animal = .lion
        case "tiger":
            animal = .tiger
        default:
            animal = AnimalModel(id: "cat", name: "cat", avatar: "🐱")
        }
        return animal
    }
}

/// Data转字典/数组
func DataToObject(_ data: Data) -> Any? {
    do {
        let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        return object
    } catch {
        print(error)
    }
    return nil
}
