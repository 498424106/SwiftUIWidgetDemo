//
//  ZSWidgetBundle.swift
//  ZSWidget
//
//  Created by zs on 2024/10/30.
//

import WidgetKit
import SwiftUI

@main
struct ZSWidgetBundle: WidgetBundle {
    var body: some Widget {
        ZSWidget()
        StaticConfigurationWidget()
    }
}
