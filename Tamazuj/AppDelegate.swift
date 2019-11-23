//
//  AppDelegate.swift
//  Tamazuj
//
//  Created by Saadi on 9/5/19.
//  Copyright © 2019 Tamazuj. All rights reserved.
//

import UIKit
import IQKeyboardManager
import UserNotifications
import Firebase


var canShowNoData = true

// --- Notifications ---
//extension Notification.Name {
//
//    static let RecivePushNotificationWhileAppOpen          = Notification.Name("RecivePushNotificationWhileAppOpen")
//    static let RecivePushNotificationWhileAppInBackground  = Notification.Name("RecivePushNotificationWhileAppInBackground")
//    static let OpenedFromPushNotificationWhileInBackground = Notification.Name("OpenedFromPushNotificationWhileInBackground")
//
//}


struct AppFontName {
    static let regular = "Cairo-Regular"
    static let bold = "Cairo-Bold"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold
            
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    override init() {
        super.init()
        UIFont.overrideInitialize()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        
        
        
        
        
        //        if let launchOptions = launchOptions {
        //            if let userInfo = launchOptions[.remoteNotification] as? [AnyHashable: Any] {
        //                handleNotifications(application, userInfo: userInfo as [NSObject : AnyObject], updateUI: false)
        //            }
        //        }
        
        
        //////////////////////////////////
        // Reset Badge Number
        //        application.applicationIconBadgeNumber = 0
        
        
        
        //        let notifiction = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification]
        
        
        ///number badge
        //        UIApplication.shared.applicationIconBadgeNumber = 55
        
        
        //        UIApplication.shared.application
        
        //      UIApplication.shared.isRegisteredFor
        
        //        if notifiction != nil {
        //            print("RemoteNotifications")
        //        }
        
        
        Messaging.messaging().delegate = self
        FirebaseApp.configure()
        
        
        
        
        //        regesterNotfictin()
        IQKeyboardManager.shared().isEnabled = true
        // Override point for customization after application launch.
        // Sets background to a blank/empty image
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = .clear
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        
        if let APItoken = helper.getUserToken() , APItoken != nil {
            switch helper.getUserType() {
            case "user": WindowManger.show(.main, animated: true)
            case "advisoer": WindowManger.show(.Advisor, animated: true)
            default:
                WindowManger.show(.account, animated: true)
            }
        }
    
        return true
    }
    /**
     *  APNS
     */
    
    //    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    //        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
    //        // f9a3926229b3344d20b0a8a966527f952fe888863521710c2226391f15df8121
    //        print("this is token:",token)
    //
    //
    //    }
    
    //    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    //
    //        let deviceTokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
    //        // f9a3926229b3344d20b0a8a966527f952fe888863521710c2226391f15df8121
    //
    //        print("Device Token: " + deviceTokenString)
    //
    //        UserDefaults.standard.set(deviceTokenString, forKey: "DeviceToken")
    //        UserDefaults.standard.synchronize()
    //

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications : \(error.localizedDescription)")
    }
/**
 * Failed to Register for Remote Notifications
 */
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        #if !(targetEnvironment(simulator)) // !TARGET_IPHONE_SIMULATOR
//        print("Error in registration. Error: \(error)");
//        #endif
//
//    }
//    // Not used
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        print(userInfo)
//        handleNotifications(application, userInfo: userInfo as [NSObject : AnyObject], updateUI: true)
//
//    }


/// Background
///Foreground
//// open app
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//
//        if application.applicationState == .inactive{
//            print("inactive")
//        }
//        if application.applicationState == .background{
//            print("background")
//        }
//        if application.applicationState == .active{
//            print("active")
//        }
//
//
//        let aps = userInfo["aps"] as! [String:Any]
//        let alert = aps["alert"] as! [String:Any]
//        let title =  alert["title"] as! String
//
//        NotificationCenter.default.post(name: NSNotification.Name("test"), object: nil, userInfo: ["title":title])
//    }


/**
 * Remote Notification Received while application was open.
 */
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
//
//        #if !(targetEnvironment(simulator)) // !TARGET_IPHONE_SIMULATOR
//        handleNotifications(application, userInfo: userInfo as [NSObject : AnyObject], updateUI: true)
//
//        //  print("Remote notification: \(userInfo.description)")
//
//        if let aps = userInfo["aps"] as? [String:Any] {
//            if (aps["alert"] as? String) != nil {
//                //   print("Received Push Alert: \(alert)")
//            }
//
//            if (aps["sound"] as? String) != nil {
//                //   print("Received Push Sound: \(sound)")
//
////                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            } else {
//
////                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//            }
//
//            if let badge = aps["badge"] as? String {
//                //    print("Received Push Badge: \(badge)")
//                application.applicationIconBadgeNumber = application.applicationIconBadgeNumber + Int(badge)!
//            }
//
//        }
//
//        #endif
//
//    }

// Mark: Push Notifications
//    func setupRemoteNotifications(_ application: UIApplication, withOptions launchOptions: [AnyHashable: Any]?){
//
//        #if !(targetEnvironment(simulator)) // !TARGET_IPHONE_SIMULATOR
//
//        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil )
//
//        application.registerUserNotificationSettings( settings )
//        // Add registration for remote notifications
//        application.registerForRemoteNotifications()
//
//
//        // Clear application badge when app launches - if registered for it
//        if let settings = UIApplication.shared.currentUserNotificationSettings {
//            if settings.types.contains( .badge ) {
//                UIApplication.shared.applicationIconBadgeNumber = 0;
//            }
//        }
//
//        #endif
//    }

//    func regesterNotfictin(){
//        UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound ,.alert]) { (grant, error) in
//            if grant{
//
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//
//            }
//        }
//
//    }


func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)
    
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
    }
    
    // Print full message.
    print(userInfo)
}

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                 fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)
    
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
    }
    
    // Print full message.
    print(userInfo)
    
    completionHandler(UIBackgroundFetchResult.newData)
}
///////////////////////////////////////////////////////////////////////////////////////////
//    @objc public var pushNotificationUserInfo:NSDictionary?
//
//    // Private Method
//    fileprivate func handleNotifications(_ application: UIApplication, userInfo:[NSObject: AnyObject], updateUI: Bool) {
//
//        print("Notification received: \(userInfo as NSDictionary)")
//
//        if (application.applicationState == .active) {
//            //app is currently active, can update badges count here
//
//
//
//            NotificationCenter.default.post(name: .RecivePushNotificationWhileAppOpen, object: nil, userInfo:userInfo)
//
//        } else if (application.applicationState == .background) {
//            //app is in background, if content-available key of your notification is set to 1, poll to your backend to retrieve data and update your interface here
//
//            // Do nothing :)
//            NotificationCenter.default.post(name: .RecivePushNotificationWhileAppInBackground, object: nil, userInfo:userInfo)
//
//        } else if (application.applicationState == .inactive) {
//            //app is transitioning from background to foreground (user taps notification), do what you need when user taps here
//
//            // If Opened Notification while App "In Background"
//            if updateUI {
//                NotificationCenter.default.post(name: .OpenedFromPushNotificationWhileInBackground, object: nil, userInfo:userInfo)
////
//            } else { // If Opened Notification While App "Closed"
//                pushNotificationUserInfo = userInfo as NSDictionary
//                print("pushNotificationUserInfo\(String(describing: pushNotificationUserInfo))")
//
//
//            }
//
//        }
//
//    }

//}
}
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    
    //TODO: app open m
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        NotificationCenter.default.post(name: NSNotification.Name("open"), object: nil, userInfo: userInfo)
        // Change this to your preferred presentation option
        completionHandler([.alert,.badge,.sound])
    }
    //TODO: app in background
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        NotificationCenter.default.post(name: NSNotification.Name("backgrund"), object: nil, userInfo: userInfo)
        if userInfo != nil{
            
//            let vc = UIStoryboard(name: "Min", bundle: nil).instantiateViewController(withIdentifier: "pfilnav") as! UINavigationController
            
            
            WindowManger.show(.main, identifier: "MenuViewController", animated: true)
        }
        
        
        
        completionHandler()
    }
}

extension AppDelegate : MessagingDelegate{
   
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    //    func application(application: UIApplication,
    //                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    //        Messaging.messaging().apnsToken = deviceToken as Data
    //    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("remoteMessage",remoteMessage.appData)
    }
    //    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    //        print("fcmToken",fcmToken)
    //    }
    //
    //    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    //        print("Firebase registration token: \(fcmToken)")
    //
    //        let dataDict:[String: String] = ["token": fcmToken]
    //        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    //        // TODO: If necessary send token to application server.
    //        // Note: This callback is fired at each app startup and whenever a new token is generated.
    //    }
}
