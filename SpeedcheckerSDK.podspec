Pod::Spec.new do |spec|

  spec.name         = "SpeedcheckerSDK"
  spec.version      = "1.8.11"
  spec.summary      = "Free speed test for your own app."

   spec.description  = <<-DESC
  - latency, download and upload speed of the user connection
  - robust measuring of cellular, wireless, even local network
  - testing details like the current speed and progress
  - additional information like network type and location
  - included high-capacity servers provided and maintained by Speedchecker or custom servers
  - detailed statistics and reports by Speedchecker
                   DESC

  spec.homepage     = "https://github.com/speedchecker/speedchecker-sdk-ios"

  spec.license      = { :type => "Free or Commercial", :text => "https://github.com/speedchecker/speedchecker-sdk-ios#licence" }

  spec.author             = { "Speedchecker Ltd." => "https://www.speedchecker.com" }

  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/speedchecker/speedchecker-sdk-ios.git", :tag => "1.8.11" }

  spec.vendored_frameworks = "Framework/DataCompression.xcframework", "Framework/Socket.xcframework", "Framework/SpeedcheckerReportSDK.xcframework", "Framework/SpeedcheckerSDK.xcframework", "Framework/XMLParsing.xcframework"

end
