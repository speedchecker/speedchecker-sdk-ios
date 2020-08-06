//
//  ViewController.swift
//  SpeedcheckerSDK Sample
//
//

import UIKit
import SpeedcheckerSDK
import CoreLocation

class ViewController: UIViewController {

    private var internetTest: InternetSpeedTest?
    private var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func runSpeedTestTouched(_ sender: UIButton) {
        // to use free version, your app should have location access
        internetTest = InternetSpeedTest(delegate: self)
        internetTest?.startTest() { (error) in
            print(error)
        }
        
        // to use paid version, your app does not need location access
//        internetTest = InternetSpeedTest(clientID: 0, userID: 0, delegate: self)
//        internetTest?.start() { (error) in
//            print(error)
//        }
    }
    
}

extension ViewController: InternetSpeedTestDelegate {
    func internetTest(finish error: SpeedTestError) {
        print(error)
    }
    
    func internetTest(finish result: SpeedTestResult) {
        print(result.downloadSpeed.mbps)
        print(result.uploadSpeed.mbps)
        print(result.latencyInMs)
        
    }
    
    func internetTest(received servers: [SpeedTestServer]) {
        //
    }
    
    func internetTest(selected server: SpeedTestServer, latency: Int) {
        //
    }
    
    func internetTestDownloadStart() {
        //
    }
    
    func internetTestDownloadFinish() {
        //
    }
    
    func internetTestDownload(progress: Double, _ speed: SpeedTestSpeed?) {
        //
    }
    
    func internetTestUploadStart() {
        //
    }
    
    func internetTestUploadFinish() {
        //
    }
    
    func internetTestUpload(progress: Double, _ speed: SpeedTestSpeed?) {
        //
    }
    
    
}

