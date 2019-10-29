//
//  AppDelegate.swift
//  FuelTracker
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import UIKit
import SwiftyBeaver

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if CommandLine.arguments.contains("-resetTable") {
            resetTable()
        }
        
        setupSwiftyBeaver()
        SwiftyBeaver.info("Starting SwifyBeaver Logging!")
        
        return true
    }
        
    private func resetTable() {
        let database = Database().myDatabase
        let fuelsManager = FuelsManager(database: database)
        fuelsManager.dropTable()
        fuelsManager.createTable()
    }
    
    private func setupSwiftyBeaver() {
        let console = ConsoleDestination()
        let file = FileDestination()
        
        SwiftyBeaver.addDestination(console)
        SwiftyBeaver.addDestination(file)
    }
    
}
