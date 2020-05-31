//
//  AppDelegatePlug.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 27/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit

open class AppDelegatePlug: UIResponder, UIApplicationDelegate {

    open var services: [AppPlugService] { return [] }

    lazy var _services: [AppPlugService] = {
        return self.services
    }()

    @discardableResult
    internal func apply<T, S>(_ work: (AppPlugService, @escaping (T) -> Void) -> S?, completionHandler: @escaping ([T]) -> Void) -> [S] {
        let dispatchGroup = DispatchGroup()
        var results: [T] = []
        var returns: [S] = []

        for service in _services {
            dispatchGroup.enter()
            let returned = work(service, { result in
                results.append(result)
                dispatchGroup.leave()
            })
            if let returned = returned {
                returns.append(returned)
            } else { // delegate doesn't impliment method
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            completionHandler(results)
        }

        return returns
    }
}
