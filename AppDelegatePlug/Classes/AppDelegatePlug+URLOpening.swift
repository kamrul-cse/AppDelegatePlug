//
//  AppDelegatePlug+URLOpening.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

extension AppDelegatePlug {

    @available(iOS 9.0, *)
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        var result = false
        for service in _services {
            if service.application?(app, open: url, options: options) ?? false {
                result = true
            }
        }
        return result
    }
}
