import UIKit
import UNLMapSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let unlMap = UNLMapSDK()
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        unlMap.configMap(headers: ["x-unl-api-key": "TyWCPuvtqc4xAE8jGZX6IWKnPRpWKQWf",
                                   "x-unl-vpm-id": "b96e28f6-a262-42e9-a337-a54ea90090f8"])
        
        // Override point for customization after application launch.
//        let sessionConfig = URLSessionConfiguration.default
//        sessionConfig.httpAdditionalHeaders = ["x-unl-api-key": "TyWCPuvtqc4xAE8jGZX6IWKnPRpWKQWf",
//                                               "x-unl-vpm-id": "b96e28f6-a262-42e9-a337-a54ea90090f8"
//                                               ]
//        MGLNetworkConfiguration.sharedManager.sessionConfiguration = sessionConfig
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

