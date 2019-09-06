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
    
    /**
     Initialize the mandatory Approver SDK Credentials notably App Id
     
     - Parameters:
        - launchOptions: A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
        - appId: Approver SDK App Id obtained from developer portal at https://api.approver.io/dev
     */
    @objc public static func initializeWithLaunchOptions(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
                                                         appId: String) {
        ApproverEngine.shared.initialize(launchOptions: launchOptions, appId: appId)
    }
    
    /**
     Prompt Users to Enable Notifications
     
     - Parameters:
        - options: Constants for requesting authorization to interact with the user. By default the constatns are alert, sound, badge.
        - userResponce: The block to execute asynchronously with the results. This block may be executed on a background thread. The block has no return value and has the following parameters:
        - granted: A Boolean value indicating whether authorization was granted. The value of this parameter is true when authorization was granted for one or more options. The value is false when authorization is denied for all options.
     
     - Tag: promptForPushNotifications
    */
    @objc public static func promptForPushNotifications(options: UNAuthorizationOptions = [.alert, .sound, .badge],
                                                        userResponce: (_ granted: Bool) -> () ) {
        ApproverEngine.shared.promptForPushNotifications(options: options, userResponce: userResponce)
    }
    
    /**
     Token that identifies this device to push services
     
     - Tag: PushTokenType
    */
    public enum PushToken {
        /** APNs token */
        case apns(token: String)
        /** Firebase token */
        case firebase(token: String)
        /** Custom service token */
        case custom(token: String, serviceDesc: Dictionary<String, String>)
    }
    
    /**
     A globally unique token that identifies this device to APNs, Firebase or any other push services.
     
     - Important: If app doesn't use Approver [promptForPushNotifications(options:userResponce)](x-source-tag://promptForPushNotifications) approach
                  then the pushToken has to be installed manually once APNs push token has received in some other way
     
     - Note: Example: In case if app handles push token registration himself
     ```
     func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        Approver.shared.pushToken(.apns(tokenParts.joined()))
     }
     ```
     
     - Parameters:
        - token: Push token with its [service type](x-source-tag://PushTokenType)
     
     - Tag: pushToken
     */
    public static func pushToken(_ token: PushToken?) {
        ApproverEngine.shared.pushToken(token)
    }
    
    /**
     Log an event.
     
     - Parameters:
        - name The name of the event to be tracked
        - value Arbitrary value to be tracked
     */
    public static func logEvent(_ name: String, value: String) {
        ApproverEngine.shared.logEvent(name, value)
    }
    
    /**
     Log a push info payload.
     
     A push info payload uploads immediately
     
     - Note: If there is any impl of UNUserNotificationCenterDelegate then use the method insdie callbacks
     to notify about a push notification being recieved.
     
     - Parameters:
        - pushPayload The push notification payload has been received
     */
    public static func logPush(pushPayload: [AnyHashable : Any]) {
        ApproverEngine.shared.logPush(pushPayload: pushPayload)
    }
    
    /**
     Log a user's email and unique id if any
     
     - Warning: The data is requred to help to optimize an app experience
     by making it easy to analyze and scale product and marketing experiments
     
     - Parameters:
        - email User's email
        - id User unique identifier. Can be nil if there is no any.
    */
    public static func logUser(email: String, id : String? = nil) {
        ApproverEngine.shared.logUser(email: email, id: id)
    }
    
} // class Approver

public extension Approver {
    
    /**
     Parses an APS push payload
     
     Useful to call from your NotificationServiceExtension.
     
     - Parameters:
        - request: The original notification request. This object is used to get the original content of the notification.
        - content: A UNNotificationContent object with the content to be displayed to the user.
     */
    static func didReceiveNotificationExtensionRequest(_ request: UNNotificationRequest, with content : UNMutableNotificationContent) {
        ApproverEngine.shared.didReceiveNotificationExtensionRequest(request, with: content)
    }
    
    /**
     An opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
     
     Useful to call from your NotificationServiceExtension.
     
     - Parameters:
        - request: The original notification request. This object is used to get the original content of the notification.
        - content: A UNNotificationContent object with the content to be displayed to the user.
     */
    static func serviceExtensionTimeWillExpire(_ request: UNNotificationRequest, with content: UNMutableNotificationContent) {
        ApproverEngine.shared.serviceExtensionTimeWillExpire(request, with: content)
    }
}


// UNNotificationResponse().notification.request.content.userInfo
