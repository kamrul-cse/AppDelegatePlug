//
//  AppStatePlug.swift
//  AppDelegatePlug_Example
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import AppDelegatePlug

//
//This is for below iOS 13
//
final class AppStatePlug: NSObject, AppPlugService {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("🎉 AppStatePlug has started!")
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("🤔 AppStatePlug application Will Resign Active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("🙀 AppStatePlug application Did Enter Background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("😻 AppStatePlug application Will Enter Foreground")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("🥳 AppStatePlug application Did Become Active")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("😎 AppStatePlug application Will Terminate")
    }
}
