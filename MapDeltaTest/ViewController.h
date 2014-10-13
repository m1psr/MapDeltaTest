//
//  ViewController.h
//  MapDeltaTest
//
//  Created by M on 13.10.14.
//  Copyright (c) 2014 M. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *centerLabel;
@property (weak, nonatomic) IBOutlet UILabel *deltasLabel;
@property (weak, nonatomic) IBOutlet MKMapView *worldMapView;

- (IBAction)teleportButtonTapped;

@end
