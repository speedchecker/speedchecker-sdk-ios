# Speedchecker SDK for iOS, version 1.7

The embedded framework version of the Speedchecker Speed Test supports its own API which allows you to access various methods and events easily from the your iOS application code. You can also try our  [Speedchecker on App Store](https://itunes.apple.com/app/id658790195), it's powered by the latest Speedchecker SDK version.

## Features
- latency, downlad and upload speed of the user connection
- robust measuring of cellular, wireless, even local network
- testing details like the current speed and progress
- additional information like network type and location
- stable servers by Speedchecker or custom server solutions
- detailed statistics and reports by Speedchecker

## Requirements
  - Xcode 9.0 or later
  - Swift 4 or Objective-C
  - Development Target 10.0 or later
  - Bundle Identifier licensed by Speedchecker Ltd.

## Installation
1. Place the SpeedcheckerSDK.framework into your Xcode project. We recommend you to copy it rather than to reference from an other location.
2. In your application target, go to General tab and drag SpeedcheckerSDK.framework item into Embeded Binaries section. So than you should see it in the Embeded Binaries and also in the Linked Frameworks and Libraries sections. 
3. Go to Build Phases tab and recheck it’s added in Link Binary With Libraries and also in the Embedded Frameworks section.
4. Now the SpeedcheckerSDK framework should be importable to your code.
	#### Swift
    ```swift
    import SpeedcheckerSDK
    ```
    
    #### Objective-C
    ```objc
    #import "SpeedcheckerSDK/SpeedcheckerSDK.h"
    #import "SpeedcheckerSDK/SpeedcheckerSDK-Swift.h"
    ```

## What's next?
Please contact us for future details and license requirements. Also you can download the latest framework version, the sample app to see detailed implementation in Xcode project as well as our Internet Speed Test application on App Store.
- [Contact us](http://www.speedchecker.xyz/contact-us.html)
- [Speedchecker on App Store](https://itunes.apple.com/app/id658790195)
- [Framework](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Framework/SpeedcheckerSDK.framework)
- [Sample app in Swift](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Sample%20in%20Objective-C)
- [Sample app in Objective-C](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Sample%20in%20Swift)
