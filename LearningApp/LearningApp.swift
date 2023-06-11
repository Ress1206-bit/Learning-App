//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Adam Ress on 6/10/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
