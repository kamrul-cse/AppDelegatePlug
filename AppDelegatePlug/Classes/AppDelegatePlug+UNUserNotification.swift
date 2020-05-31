//
//  AppDelegatePlug+UNUserNotification.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UserNotifications

extension AppDelegatePlug: UNUserNotificationCenterDelegate {

    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        for service in _services {
            service.userNotificationCenter?(center, willPresent: notification, withCompletionHandler: completionHandler)
        }
    }

    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        for service in _services {
            service.userNotificationCenter?(center, didReceive: response, withCompletionHandler: completionHandler)
        }
    }


    @available(iOS 12.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        for service in _services {
            service.userNotificationCenter?(center, openSettingsFor: notification)
        }
    }


}
