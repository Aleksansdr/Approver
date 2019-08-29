//
//  Approver.swift
//  Approver
//
//  Created by Oleksandr Liashko on 8/23/19.
//  Copyright © 2019 Oleksandr Liashko. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

/**
 Approver iOS SDK.
 
 Use the Approver SDK to design and send push notifications,
 track and report events occured in your application.
 
 Developers using the Metrics SDK with their app are required to register for
 a credential, and to specify the credential (appId) in their application.
 Failure to do so results in blocked access to certain features and degradation
 in the quality of other services.
 
 To obtain these credentials, visit the developer portal at https://api.approver.io/dev
 and register for a license.
 
 - Note: Credentials are unique to your application's bundle identifier.
 Do not reuse credentials across multiple applications.
 
 Adding Credentials
 
 Ensure that you have provided the apiKey before using the Approver SDK.
 For example, set them in your app delegate:
 
 ```
 func application(_ application: UIApplication,
 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Replace 'YOUR_APP_ID' with your Approver App ID.
    Approver.initializeWithLaunchOptions(launchOptions, appId: 'YOUR_APP_ID')
 }
 ```
 */
public final class Approver : NSObject {
    
    /// The singleton Approver object.
    @objc public static let shared = Approver()
    private override init() { }
    
    /**
     Initialize the mandatory Approver SDK Credentials notably App Id
     
     - Parameters:
        - launchOptions: A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
        - appId: Approver SDK App Id obtained from developer portal at https://api.approver.io/dev
     */
    @objc public static func initializeWithLaunchOptions(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
                                                         appId: String) {
        
    }
    
    /**
     Prompt Users to Enable Notifications
     
     - Parameters:
        - options: Constants for requesting authorization to interact with the user. By default the constatns are alert, sound, badge.
        - userResponce: The block to execute asynchronously with the results. This block may be executed on a background thread. The block has no return value and has the following parameters:
        - granted: A Boolean value indicating whether authorization was granted. The value of this parameter is true when authorization was granted for one or more options. The value is false when authorization is denied for all options.
    */
    @objc public static func  promptForPushNotifications(options: UNAuthorizationOptions = [.alert, .sound, .badge],
                                                         userResponce: (_ granted: Bool) -> () ) {
        
    }
    
    
    
    //@objc public static func getPermissionState() -> Approver.PermissionState {}
    // 
    
    /*
     
     pushToken
     
    public var pushToken : String?
    { didSet { return "" } }
    { willSet { } }
     
     
     send notification
    notification for push token
    */
    
} // class Approver

extension Approver {
    
    /**
     Parses an APS push payload
     
     Useful to call from your NotificationServiceExtension.
     
     - Parameters:
        - request: The original notification request. This object is used to get the original content of the notification.
        - content: A UNNotificationContent object with the content to be displayed to the user.
     */
    static func didReceiveNotificationExtensionRequest(_ request: UNNotificationRequest, with content : UNMutableNotificationContent) {
        
    }
    
    /**
     An opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
     
     Useful to call from your NotificationServiceExtension.
     
     - Parameters:
        - request: The original notification request. This object is used to get the original content of the notification.
        - content: A UNNotificationContent object with the content to be displayed to the user.
     */
    static func serviceExtensionTimeWillExpire(_ request: UNNotificationRequest, with content: UNMutableNotificationContent) {
        
    }
}