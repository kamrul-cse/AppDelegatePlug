//
//  AppServicesManager+HandlingActions.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

extension AppDelegatePlug {

    // Called when the user activates your application by selecting a shortcut on the home screen,
    // except when -application:willFinishLaunchingWithOptions: or -application:didFinishLaunchingWithOptions returns NO.
    @available(iOS 9.0, *)
    open func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        apply({ (service, completionHandler) -> Void? in
            service.application?(application, performActionFor: shortcutItem, completionHandler: completionHandler)
        }, completionHandler: { results in
            // if any service handled the shortcut, return true
            let result = results.reduce(false, { $0 || $1 })
            completionHandler(result)
        })
    }
}
