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
        // Init BackgroundTest with your license key and config URL
        if backgroundTest == nil {
            let configURL = "" // use your config URL
            backgroundTest = BackgroundTest(licenseKey: "Your license key", url: configURL)
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
        
        // For demo purpose here we request both when-in-use and always location permissions
        // You can ask user for permissions in a place that you find most appropriate regarding your app UI
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
