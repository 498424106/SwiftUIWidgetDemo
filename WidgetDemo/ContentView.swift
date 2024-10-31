//
//  ContentView.swift
//  WidgetDemo
//
//  Created by zs on 2024/10/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //模拟用户在app中手动存储了数据
        Button(action: {
            if let appGroupDefaults = UserDefaults(suiteName: groupId) {
                var arr : [AnimalModel]  = []
                arr.append(AnimalModel(id: "panda", name: "panda", avatar: "🐼"))
                arr.append(AnimalModel(id: "lion", name: "lion", avatar: "🦁️"))
                arr.append(AnimalModel(id: "tiger", name: "tiger", avatar: "🐯"))
                arr.append(AnimalModel(id: "cat", name: "cat", avatar: "🐱"))

                UserDefaults.AnimalModelArr = arr
                let aaaaaaaaaa = UserDefaults.AnimalModelArr
                print(aaaaaaaaaa)
            }
        }){
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .frame(width: 100, height: 100)
        .background(.red)
    }
}
