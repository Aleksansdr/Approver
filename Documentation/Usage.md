- [Using Approver](#using-approver)
  - [Introduction](#introduction)
  - [Adding Credentials](#"adding-credentials")
  - [Approver Debug Settings](#"approver-debug-settings")
  - [Dynamic Views](#"dynamic-views")
    - [Registration](#"dynamic-views-registration")
    - [Instantiation](#"dynamic-views-instantiation")
    - [Actions](@"dynamic-views-action")


# Using Approver
## Introduction

 Approver iOS SDK.

 Use the Approver SDK to dynamically configure views, track and report events occurred in your application.

 Developers using the Approver SDK with their app are required to register for
 a credential, and to specify the credential (apiKey) in their application.
 Failure to do so results in blocked access to certain features and degradation
 in the quality of other services.

 To obtain these credentials, visit the developer portal at https://api.approver.io/dev
 and register for a license.

 > Credentials are unique to your application's bundle identifier.
 Do not reuse credentials across multiple applications.

## Adding Credentials

Ensure that you have provided the apiKey before using the Approver SDK.
For example, set them in your app delegate:

```swift
import Approver

func application(_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   try? Approver.shared.initialize(apiKey: "{YOUR_API_KEY}")
}
```

## Approver Debug Settings

 ApproverSettings.plist this is where you can configure debug options for your Approver app.
 To use ApproverSettings.plist file to configure Approver debug options need just to  add new file to xCode project and name it respectively ApproverSettings.plist.

 ##### Options
 - `dynamicViewObserving` Boolean type, turns on serial checking of dynamic views changed on backend side-
 - `dynamicViewResyncTimePeriod` - Number type, checking dynamic view period

## Dynamic Views

### Registration

All dynamic views that will be used has to be registered initially.

```swift
import Approver

enum DynamicViewsIDs : String {
    case introduction, payment, overview
}

func application(_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  ...
  Approver.shared.dynamicViews(ids: [DynamicViewsIDs.introduction.rawValue,
                                     DynamicViewsIDs.payment.rawValue,
                                     DynamicViewsIDs.overview.rawValue])
  ...
}
```

Now that you can use https://admin.approver.io/dynamic-views to configure your views.

If no View has been registered previously for exact id yet then corresponding
blanc view will be created on backend side and return instantly.
If there is any problem with connection then preliminarily
stored views are used. The file containing views information should be
inserted into main bundle. The default name is: "DefaultDynamicViewsSource.txt".
In case of the file's custom name its name has to be passed as argument `localSourceName`
into the function.


### Instantiation

The following code example demonstrates how to create an Approver's view controller with dynamic view

```swift
let vc = ApproverFactory.createMod(dynamicView: DynamicViewsIDs.introduction.rawValue)
sender.present(vc, animated: true, completion: nil)
```

The Approver view controller can be used as any other view controller since it is inherited from UIViewController

### Actions

For now callback actions are allowed with UIButton, UITextField

```swift
let vc = ApproverFactory
                .createMod(dynamicView: DynamicViewsIDs.introduction.rawValue,
                    contentOperations: [
                    action(id: "bttnActionReg") { (event : ActionEvent) in
                        /// it is invoked when a button with action id=bttnActionReg pressed
                    },
                    action(id: "textField1") { (event : ActionEvent) in
                      /// it is invoked when a text field with id=textField1 touched up inside
                    },
                    formAction(id: "bttnActionReg") { (event : ActionEvent) in
                      /// the one is invoked when touch on any button or text field on dynamic view
                    }
                ])

self.present(vc, animated: true, completion: nil)

```
