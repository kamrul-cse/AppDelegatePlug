//
//  AppDelegatePlug+CloudKitHandling.swift
//  AppDelegatePlug
//
//  Created by Md. Kamrul Hasan on 31/5/20.
//  Copyright © 2020 MKHG Lab. All rights reserved.
//

import UIKit
import CloudKit

extension AppDelegatePlug {

    // This will be called on the main thread after the user indicates they want to accept a CloudKit sharing invitation in your application.
    // You should use the CKShareMetadata object's shareURL and containerIdentifier to schedule a CKAcceptSharesOperation, then start using
    // the resulting CKShare and its associated record(s), which will appear in the CKContainer's shared database in a zone matching that of the record's owner.
    @available(iOS 10.0, *)
    open func application(_ application: UIApplication, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShare.Metadata) {
        for service in _services {
            service.application?(application, userDidAcceptCloudKitShareWith: cloudKitShareMetadata)
        }
    }
}
