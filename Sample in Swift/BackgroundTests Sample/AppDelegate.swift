//
//  AppDelegate.swift
//  BackgroundTests Sample
//
//

import UIKit
import CoreLocation
import SpeedcheckerSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var backgroundTest: BackgroundTest?
    var locationManager: CLLocationManager? = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Init BackgroundTest with your license key and optionally config URL
        if backgroundTest == nil {
            backgroundTest = BackgroundTest(licenseKey: "Your license key")
        }
        
        // Load your configuration
        backgroundTest?.loadConfig(launchOptions: launchOptions, completion: { success in
            // Handle case if configuration was not loaded successfully
        })
        
        // Setup location manager
        if launchOptions?[UIApplication.LaunchOptionsKey.location] != nil {
            locationManager = CLLocationManager()
        }
        locationManager?.delegate = self
        backgroundTest?.prepareLocationManager(locationManager: locationManager)
        
        // Register BGProcessingTask
        backgroundTest?.registerBGTask(locationManager)
        
        // For demo purposes, request both When‑In‑Use and Always location permissions at launch
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
                self?.locationManager?.requestWhenInUseAuthorization()
                self?.locationManager?.requestAlwaysAuthorization()
            }
        }
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        backgroundTest?.didChangeAuthorization(manager: manager, status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        backgroundTest?.didUpdateLocations(manager: manager, locations: locations)
    }
}
