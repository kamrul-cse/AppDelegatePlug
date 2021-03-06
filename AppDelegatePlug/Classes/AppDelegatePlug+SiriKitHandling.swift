//
//  AppDelegatePlug+SiriKitHandling.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit
import Intents

extension AppDelegatePlug {

    @available(iOS 11.0, *)
    open func application(_ application: UIApplication, handle intent: INIntent, completionHandler: @escaping (INIntentResponse) -> Void) {
        apply({ (service, completionHandler) -> Void? in
            service.application?(application, handle: intent, completionHandler: completionHandler)
        }, completionHandler: { results in
            let result = results.min(by: { $0.hashValue < $1.hashValue }) ?? INIntentResponse()
            completionHandler(result)
        })
    }
}
