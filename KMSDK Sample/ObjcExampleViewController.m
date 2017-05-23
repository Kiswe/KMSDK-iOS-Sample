//
//  ObjcExampleViewController.m
//  KMSDK Sample
//
//  Created by Rodrigo Pacheco Curro on 5/18/17.
//  Copyright © 2017 Kiswe. All rights reserved.
//

#import "ObjcExampleViewController.h"
#import <KMSDK/KMSDK-Swift.h>
#import <KMSDK/KMParentViewController.h>

@interface ObjcExampleViewController () <KMMediaControllerDelegate>

@end

@implementation ObjcExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[KMSDK shared] setAPIToken:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJLaXN3ZSIsInN1YiI6IjEzODU2MiIsImV4cCI6IjIwMTctMDktMDhUMjE6NTU6MzAuNzk0WiJ9.qgveH0QTXoHmJZRQNFeMl6Uy9kTtXXbKod-cj1x9bXI"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[KMSDK shared] parentViewControllerWithEventId:@"5957" username:@"TestUser" completion:^(KMParentViewController * _Nullable parentVC) {
        if (parentVC) {
            [self presentViewController:parentVC animated:true completion:nil];
            [parentVC.mediaPlayerController setDelegate:self];
        }
    }];
    
}

#pragma mark - KMMediaControllerDelegate

- (void)mediaController:(KMMediaViewController *)mediaController playerStateDidChange:(enum KMMediaState)newState {
    switch (newState) {
        case KMMediaStateReadyToPlay:
            NSLog(@"media player is ready to play");
            break;
        case KMMediaStatePlaying:
            NSLog(@"media player is playing");
            break;
        case KMMediaStatePaused:
            NSLog(@"media player is paused");
            break;
        default:
            break;
    }
}

@end
