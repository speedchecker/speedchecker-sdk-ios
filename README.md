# Speedchecker SDK for iOS, version 1.5.66 - Free speed test for your own app.

The embedded framework version of the Speedchecker Speed Test supports its own API which allows you to access various methods and events easily from the your iOS application code. You can also try our  [Speedchecker on App Store](https://itunes.apple.com/app/id658790195), it's powered by the latest Speedchecker SDK version. More information about [SpeedChecker SDKs](https://www.speedchecker.com/speed-test-tools/mobile-apps-and-sdks.html)

## Features
- latency, download and upload speed of the user connection
- robust measuring of cellular, wireless, even local network
- testing details like the current speed and progress
- additional information like network type and location (see KPI list below in FAQ)
- included high-capacity servers provided and maintained by [Speedchecker](https://www.speedchecker.com) or custom servers
- detailed statistics and reports by Speedchecker

## Requirements
  - Xcode 13.3.1 or later
  - Swift 5
  - Development Target 11.0 or later

## Installation

### Swift Package Manager

1. File > Add Packages...
2. Add `https://github.com/speedchecker/speedchecker-sdk-ios`
3. Select "Up to Next Major" with "1.5.61"

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
  pod 'SpeedcheckerSDK'
end
```

### Manually

1. Place the `SpeedcheckerSDK.xcframework` and all other frameworks from [Framework folder](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Framework) into your Xcode project. We recommend you to copy it rather than to reference from an other location.
2. In your application target, go to the _General tab_, section _Frameworks, Libraries, and Embedded Content_, and set "Embed & Sign" for all added frameworks.
3. Go to _Build Phases_ tab and recheck it’s added in _Link Binary With Libraries_ and also in the _Embedded Frameworks_ section.

 Now the SpeedcheckerSDK framework should be importable to your code.
#### Swift
```swift
import SpeedcheckerSDK
```    
You can download our [Sample App](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Sample%20in%20Swift) to get better understanding how it works or review [API documentation](https://github.com/speedchecker/speedchecker-sdk-ios/wiki/API-documentation)

## Licence 
SpeedChecker is offering different types of licences

| Free  | Basic  | Advanced |
| ------------- | ------------- | ------------- |
| Download / Upload / Latency  | Download / Upload / Latency  | Download / Upload / Latency  |
| Device / Network KPIs  | Device / Network KPIs  | Device / Network KPIs  |
| - | Customization of test duration, multi-threading, warm-up phase etc | Customization of test duration, multi-threading, warm-up phase etc |
| Required location permissions | - | - |
| Required data sharing | - | - |
| - | Custom measurement servers | Custom measurement servers |
| - | - | Background data collection |
| Cost: FREE | Cost: 1,200 EUR per app per year | Cost: [Enquire](https://www.speedchecker.com/contact-us.html) |

## FAQ

**Is the SDK free to use?**

Yes! But the SDK collects data on network performance from your app and shares it with Speedchecker and our clients. Free SDK version requires enabled location. Those restrictions are not in Basic and Advanced versions

**Do you have Android SDK?**

Yes! Please take a look at this [repo](https://github.com/speedchecker/speedchecker-sdk-android)

**Do you provide free support?**

No, we provide support only on Basic and Advanced plans

**What are all the metrics or KPIs that you can get using our SDKs?**

iOS does not provide as many capabilities to collect network and device KPIs as Android does. Here are some of the KPIs which can be retrieved using our iOS SDK:

| iOS KPI list |
| ------------- |
| Download / Upload / Latency |
| Device Model |
| Measurement server used |
| Geolocation Accuracy |
| Latitude & Longitude |
| WiFi / Cellular connection type |
| Cellular type (e.g. 4G/3G) |
| Indication if device is charging |
| ISP |
| ASN |
| IP Address |

[Full list of our KPIs](https://docs.speedchecker.com/measurement-methodology-links/u21ongNGAYLb6eo7cqjY/kpis-and-measurements/list-of-kpis)

**Do you host all infrastructure for the test?**

Yes, you do not need to run any servers. We provide and maintain network of high quality servers and CDNs to ensure the testing is accurate. If you wish to configure your own server, this is possible on Basic and Advanced plans.

**How do you measure the speed?**

See our [measurement methodology](https://docs.speedchecker.com/measurement-methodology-links/u21ongNGAYLb6eo7cqjY/kpis-and-measurements/data-collection-methodologies)

## What's next?
Please contact us for more details and license requirements. Also you can download the latest framework version, the sample app to see detailed implementation in Xcode project as well as our Internet Speed Test application on App Store.
- [More information about SpeedChecker SDKs](https://www.speedchecker.com/speed-test-tools/mobile-apps-and-sdks.html)
- [Buy licence](https://www.speedchecker.com/contact-us.html)
- [Contact us](https://www.speedchecker.com/contact-us.html)
- [Speedchecker on App Store](https://itunes.apple.com/app/id658790195)
- [Framework](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Framework)
- [Sample app in Swift](https://github.com/speedchecker/speedchecker-sdk-ios/tree/master/Sample%20in%20Swift)
