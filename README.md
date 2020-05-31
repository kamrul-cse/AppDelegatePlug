# AppDelegatePlug

[![CI Status](https://img.shields.io/travis/mhgolap11@gmail.com/AppDelegatePlug.svg?style=flat)](https://travis-ci.org/mhgolap11@gmail.com/AppDelegatePlug)
[![Version](https://img.shields.io/cocoapods/v/AppDelegatePlug.svg?style=flat)](https://cocoapods.org/pods/AppDelegatePlug)
[![License](https://img.shields.io/cocoapods/l/AppDelegatePlug.svg?style=flat)](https://cocoapods.org/pods/AppDelegatePlug)
[![Platform](https://img.shields.io/cocoapods/p/AppDelegatePlug.svg?style=flat)](https://cocoapods.org/pods/AppDelegatePlug)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AppDelegatePlug is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppDelegatePlug'
```

## At a glance

My `AppDelegate` now looks like

```swift
import UIKit
import AppDelegatePlug


@UIApplicationMain
class AppDelegate: AppDelegatePlug {
    var window: UIWindow?
    
    override var services: [AppPlugService] {
        return [
            AppStatePlug()
        ]
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if #available(iOS 13, *) {
            //iOS 13 or greater
            //This part will take care by SceneDelegate
        }
        else {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController()
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
}

//MARK: UISceneSession Lifecycle
@available(iOS 13, *)
extension AppDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
```

and the `SceneDelegate` file looks like,

```swift
import UIKit

@available(iOS 13, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        print("🎉 SceneDelegate will Connect To session!")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("🎉 SceneDelegate scene Did Disconnect!")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("🥳 SceneDelegate application Did Become Active")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("🤔 SceneDelegate application Will Resign Active")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("😻 SceneDelegate application Will Enter Foreground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("🙀 SceneDelegate application Did Enter Background")
    }


}
```

Example `plug`: also app states now separated the states by plug, here is my `AppStatePlug` file,

```swift
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
```

## Author

Md. Kamrul Hasan, mhgolap11@gmail.com

© MKHG Lab, mkhglab@gmail.com

## License

AppDelegatePlug is available under the MIT license. See the LICENSE file for more info.
