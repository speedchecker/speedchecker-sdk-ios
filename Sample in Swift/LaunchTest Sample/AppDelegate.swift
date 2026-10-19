//
//  AppDelegate.swift
//  LaunchTest Sample
//
//

import UIKit
import SpeedcheckerSDK
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var launchTest: LaunchTest?
    var locationManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Init LaunchTest with your license key and optionally config URL
        launchTest = LaunchTest(licenseKey: "Your license key", url: "Your config URL")
        launchTest?.setup(launchOptions: launchOptions)
        
        // For demo purposes, request When‑In‑Use location permission at launch
        // In your app, move this to whatever point in the UI feels most natural
        requestLocationPermissions()
        
        return true
    }
    
    // MARK: - Helpers
    private func requestLocationPermissions() {
        DispatchQueue.global().async {
            guard CLLocationManager.locationServicesEnabled() else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.locationManager.requestWhenInUseAuthorization()
            }
        }
    }
}
