# Approver iOS SDK

Use the Approver SDK to dynamically configure views, track and report events occurred in your application.

- [Features](#features)
- [Requirements](#Requirements)
- [Installation](#installation)
- [Usage](https://github.com/Aleksansdr/Approver/blob/master/Documentation/Usage.md#using-approver)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Track events
- [x] Report events
- [x] Dynamically configured views

## Requirements

- iOS 10.0+
- Xcode 10.2+
- Swift 5+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Approver into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Approver'
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Approver into your project manually.

#### Embedded Framework

- Download SDK for iOS package from https://api.approver.io/dev and extract it to somewhere in your local file system.

- Add the Approver dynamic framework to your Xcode project. Click on your app target and choose the "General" tab. Find the section called "Embedded Binaries", click the plus (+) sign, and then click the "Add Other" button. From the file dialog box select "Approver.framework" folder. Ensure that "Copy items if needed" and "Create folder reference" options are selected, then click Finish.

- Ensure that Approver.framework appears in "Embedded Binaries" and the "Linked Frameworks and Libraries" sections.

- Run the application. Ensure that the project runs in iOS without errors.
SDK for iOS is now ready for use in your Xcode project. Now that you have your project configured to work with Approver SDK

## Credits

Approver is owned and maintained by the [Mailfire](http://mailfire.org). You can follow them on Twitter at [@MailfireSF](https://twitter.com/MailfireSF) for project updates and releases.

## License

Approver is released under the MIT license. [See LICENSE](https://github.com/Approver/Approver/blob/master/LICENSE) for details.
