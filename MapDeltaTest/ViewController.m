//
//  ViewController.m
//  MapDeltaTest
//
//  Created by M on 13.10.14.
//  Copyright (c) 2014 M. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _worldMapView.mapType = MKMapTypeHybrid;
    [self p_showRegionCoord2DAndDeltasInLabels];
}

#pragma mark - Private Methods

- (void)p_showRegionCoord2DAndDeltasInLabels
{
    CLLocationCoordinate2D center = _worldMapView.region.center;
    MKCoordinateSpan span = _worldMapView.region.span;
    
    _centerLabel.text = [NSString stringWithFormat:@"🚩 lat. %f, long. %f", center.latitude, center.longitude];
    _deltasLabel.text = [NSString stringWithFormat:@"▲lat. %f, ▲long. %f", span.latitudeDelta, span.longitudeDelta];
}

#pragma mark - IBActions

- (IBAction)teleportButtonTapped
{
    CLLocationCoordinate2D center = _worldMapView.region.center;
    MKCoordinateSpan span = _worldMapView.region.span;
    
    _worldMapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(center.latitude + span.latitudeDelta / 2, center.longitude + span.longitudeDelta /2), span);

    [self p_showRegionCoord2DAndDeltasInLabels];
}

@end
