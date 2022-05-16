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
        // Init BackgroundTest with your clientID
        if backgroundTest == nil {
            backgroundTest = BackgroundTest(clientID: 0)
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
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        backgroundTest?.applicationDidEnterBackground(locationManager: locationManager)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        backgroundTest?.applicationDidBecomeActive(locationManager: locationManager)
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
