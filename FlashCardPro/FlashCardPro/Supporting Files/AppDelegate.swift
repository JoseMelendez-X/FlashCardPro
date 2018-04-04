//
//  AppDelegate.swift
//  FlashCardPro
//
//  Created by Jose Melendez on 3/29/18.
//  Copyright © 2018 Jose Melendez. All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //location of the realm file
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        //initialize a realm
        do {
            let realm = try Realm()
        } catch {
            print("Error initializing new realm \(error.localizedDescription)")
        }
        
        return true
    }



}

