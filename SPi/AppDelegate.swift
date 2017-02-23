//
//  AppDelegate.swift
//  SPi
//
//  Created by GuoChen on 2/12/2014.
//  Copyright (c) 2014 guoc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
            window.rootViewController = ViewController()
        }
        
        if let window = window {
            if let controller = window.rootViewController as? ViewController {
                controller.pushToTutorialIfNecessary()
            }
        }
        
        func setVersionNumber() {
            if let info = Bundle.main.infoDictionary {
                let shortVersion = info["CFBundleShortVersionString"] as! String
                let buildVersion = info["CFBundleVersion"] as! String
                let version = shortVersion + " (" + buildVersion + ")"
                UserDefaults.standard.set(version, forKey: "kVersion")
            } else {
                assertionFailure("Fail to get version information")
            }
        }
        
        setVersionNumber()
        
        // Config UserVoice
        let config = UVConfig(site: "spi.uservoice.com")
        config?.forumId = 278027
        // [config identifyUserWithEmail:@"email@example.com" name:@"User Name", guid:@"USER_ID");
        UserVoice.initialize(config)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

