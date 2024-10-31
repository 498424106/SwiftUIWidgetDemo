//
//  IntentHandler.swift
//  AnimalWidgetIntent
//
//  Created by zs on 2024/10/31.
//

import Intents


class IntentHandler: INExtension, ConfigurationIntentHandling {
    func provideAnimalOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Animal>?, (any Error)?) -> Void) {
        
        let modelArr = UserDefaults.AnimalModelArr
        let animalArr: [Animal] = modelArr.map { model in
            Animal(identifier: model.id, display: model.name)
        }
        completion(INObjectCollection(items: animalArr), nil)
    }
    
    
    override func handler(for intent: INIntent) -> Any {
        return self
    }
        
}
