//
//  ViewController.swift
//  SpeedcheckerSDK Sample
//
//  Created by Lukáš Vajda on 18.07.16.
//  Copyright © 2016 Speedchecker Ltd. All rights reserved.
//

import UIKit
import SpeedcheckerSDK

class ViewController: UIViewController, SpeedTestDelegate {
	
	var speedTest: SpeedTestController?
	
	// Outlets
	@IBOutlet weak var serverValue: UILabel!
	@IBOutlet weak var latencyValue: UILabel!
	
	@IBOutlet weak var downloadValue: UILabel!
	@IBOutlet weak var downloadProgress: UIProgressView!
	
	@IBOutlet weak var uploadValue: UILabel!
	@IBOutlet weak var uploadProgress: UIProgressView!
	
	@IBOutlet weak var ispValue: UILabel!
	@IBOutlet weak var ipValue: UILabel!
	
	// Actions
	@IBAction func startButton_didTouch(sender: UIButton) {
		speedTest?.start() { error in
			if (error != .None) {
				return print("speedTest did fail: \(error.rawValue)")
			}
			
			dispatch_async(dispatch_get_main_queue()) {
				self.resetUI()
			}
		}
	}
	
	// Events
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		speedTest = SpeedTestController(clientID: 49, delegate: self)
		
		resetUI()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Helper
	func resetUI() {
		serverValue.text = nil
		latencyValue.text = nil
		
		downloadValue.text = nil
		downloadProgress.setProgress(0, animated: false)
		
		uploadValue.text = nil
		uploadProgress.setProgress(0, animated: false)
		
		self.ispValue.text = nil
		self.ipValue.text = nil
	}
	
	// Delegate: SpeedTestDelegate
	func speedTestDidReceiveServers(servers: [SpeedTestServer]) {
		print("speedTestDidReceiveServers \(servers.count)")
	}
	
	func speedTestDidSelectServer(server: SpeedTestServer, withLatencyInMs latency: Int) {
		dispatch_async(dispatch_get_main_queue()) {
			self.serverValue.text = server.domain
			self.latencyValue.text = "\(latency) ms"
		}
	}
	
	func speedTestDownloadDidStart() {
		print("speedTestDownloadDidStart")
	}
	
	func speedTestDownloadDidFinish() {
		print("speedTestDownloadDidFinish")
	}
	
	func speedTestDownloadDidProgress(progress: Double, withSpeed speed: SpeedTestSpeed?) {
		dispatch_async(dispatch_get_main_queue()) {
			self.downloadProgress.setProgress(Float(progress), animated: true)
		}
		
		if let speed = speed {
			dispatch_async(dispatch_get_main_queue()) {
				self.downloadValue.text = "\(speed.descriptionInMbps) Mb/s"
			}
		}
	}
	
	func speedTestUploadDidStart() {
		print("speedTestUploadDidStart")
	}
	
	func speedTestUploadDidFinish() {
		print("speedTestUploadDidFinish")
	}
	
	func speedTestUploadDidProgress(progress: Double, withSpeed speed: SpeedTestSpeed?) {
		dispatch_async(dispatch_get_main_queue()) {
			self.uploadProgress.setProgress(Float(progress), animated: true)
		}
		
		if let speed = speed {
			dispatch_async(dispatch_get_main_queue()) {
				self.uploadValue.text = "\(speed.descriptionInMbps) Mb/s"
			}
		}
	}
	
	func speedTestDidFinish(withResult result: SpeedTestResult) {
		print("speedTestDidFinish result: \(result)")
		
		dispatch_async(dispatch_get_main_queue()) {
			self.serverValue.text = result.server.domain
			self.latencyValue.text = "\(result.latencyInMs) ms"
			
			self.downloadValue.text = "\(result.downloadSpeed.descriptionInMbps) Mb/s"
			self.uploadValue.text = "\(result.uploadSpeed.descriptionInMbps) Mb/s"
			
			self.ispValue.text = result.ispName
			self.ipValue.text = result.ipAddress
		}
	}
	
	func speedTestDidFinish(withError error: SpeedTestError) {
		print("speedTestDidFinish error: \(error.rawValue)")
	}
}

