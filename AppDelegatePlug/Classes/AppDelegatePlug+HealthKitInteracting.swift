//
//  AppDelegatePlug+HealthKitInteracting.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

extension AppDelegatePlug {

    @available(iOS 9.0, *)
    open func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        for service in _services {
            service.applicationShouldRequestHealthAuthorization?(application)
        }
    }
}
