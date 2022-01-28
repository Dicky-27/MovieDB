//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import SwiftUI

@main
struct MovieDBApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
