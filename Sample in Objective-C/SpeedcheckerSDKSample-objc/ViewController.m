//
//  ViewController.m
//  SpeedcheckerSDKSample-objc
//
//  Created by Lukáš Vajda on 22.07.16.
//  Copyright © 2016 Speedchecker Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Properties
@property SpeedTestController *speedTest;

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *serverValue;
@property (weak, nonatomic) IBOutlet UILabel *latencyValue;

@property (weak, nonatomic) IBOutlet UILabel *downloadValue;
@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgress;

@property (weak, nonatomic) IBOutlet UILabel *uploadValue;
@property (weak, nonatomic) IBOutlet UIProgressView *uploadProgress;

@property (weak, nonatomic) IBOutlet UILabel *ispValue;
@property (weak, nonatomic) IBOutlet UILabel *ipValue;

@end

@implementation ViewController

// Events
- (void)viewDidLoad {
	[super viewDidLoad];
	
	_speedTest = [[SpeedTestController alloc] initWithClientID:49 userID:0 delegate:self];
	
	[self resetUI];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// Actions
- (IBAction)start_didTouch:(UIButton *)sender {
	[_speedTest start:^(enum SpeedTestError error) {
		if (error != SpeedTestErrorNone) {
			NSLog(@"speedTest.start did fail %d", (int)error);
			return;
		}
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self resetUI];
		});
	}];
}

// Helpers
- (void)resetUI {
	_serverValue.text = nil;
	_latencyValue.text = nil;
	
	_downloadValue.text = nil;
	[_downloadProgress setProgress:0 animated:false];
	
	_uploadValue.text = nil;
	[_uploadProgress setProgress:0 animated:false];
	
	_ispValue.text = nil;
	_ipValue.text = nil;
}

// Delegates: SpeedTestDelegate
- (void)speedTestDidReceiveServers:(NSArray<SpeedTestServer *> *)servers {
	NSLog(@"speedTestDidReceiveServers %d", (int)servers.count);
}

- (void)speedTestDidSelectServer:(SpeedTestServer *)server withLatencyInMs:(NSInteger)latency {
	dispatch_async(dispatch_get_main_queue(), ^{
        self->_serverValue.text = server.domain;
        self->_latencyValue.text = [NSString stringWithFormat:@"%d ms", (int)latency];
	});
}

- (void)speedTestDownloadDidStart {
	NSLog(@"speedTestDownloadDidStart");
}

- (void)speedTestDownloadDidProgress:(double)progress withSpeed:(SpeedTestSpeed *)speed {
	dispatch_async(dispatch_get_main_queue(), ^{
		
        [self->_downloadProgress setProgress:(float)progress];
		
		if (speed != NULL) {
            self->_downloadValue.text = [NSString stringWithFormat:@"%@ Mb/s", speed.descriptionInMbps];
		}
	});
}

- (void)speedTestDownloadDidFinish {
	NSLog(@"speedTestDownloadDidFinish");
}

- (void)speedTestUploadDidStart {
	NSLog(@"speedTestUploadDidStart");
}

- (void)speedTestUploadDidProgress:(double)progress withSpeed:(SpeedTestSpeed *)speed {
	dispatch_async(dispatch_get_main_queue(), ^{
        [self->_uploadProgress setProgress:(float)progress];
		
		if (speed != NULL) {
            self->_uploadValue.text = [NSString stringWithFormat:@"%@ Mb/s", speed.descriptionInMbps];
		}
		
	});
}

- (void)speedTestUploadDidFinish {
	NSLog(@"speedTestUploadDidFinish");
}

- (void)speedTestDidFinishWithResult:(SpeedTestResult *)result {
	dispatch_async(dispatch_get_main_queue(), ^{
        self->_serverValue.text = result.server.domain;
        self->_latencyValue.text = [NSString stringWithFormat:@"%d ms", (int)result.latencyInMs];
		
        self->_downloadValue.text = [NSString stringWithFormat:@"%@ Mb/s", result.downloadSpeed.descriptionInMbps];
        self->_uploadValue.text = [NSString stringWithFormat:@"%@ Mb/s", result.uploadSpeed.descriptionInMbps];
		
        self->_ispValue.text = result.ispName;
        self->_ipValue.text = result.ipAddress;
	});
}

- (void)speedTestDidFinishWithError:(enum SpeedTestError)error {
	NSLog(@"speedTestDidFinishWithError %d", (int)error);
}

@end
