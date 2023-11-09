//
//  allwiseApp.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.
//

import SwiftUI

@main
struct allwiseApp: App {
    
    var allLessons = AllLessonsViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView(allLessons: allLessons)
        }
    }
}
