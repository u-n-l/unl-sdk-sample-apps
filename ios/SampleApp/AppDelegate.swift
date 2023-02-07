//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Gurwinder Singh on 02/11/22.
//

import UIKit

/// Import UNLMapSDK to use it in this file
import UNLMapSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /// Initializing the UNL SDK
    let unlSDK = UNLMapSDK()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// Override point for customization after application launch.
        
        /// Configure UNL SDK while launching the App
        /// apiKey: and vpmId is mandatory to configure the sdk
        /// Set gridControl: flag true to display control, By defaults its false
        /// Set tilesSelectorControl: flag true to display inbuilt control, By defaults its false 
        unlSDK.configure(apiKey: KEY_API, vpmId: ID_VPM, gridControl: true, tilesSelectorControl: true, indoorControl: true)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

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

