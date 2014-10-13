//
//  ViewController.m
//  MapDeltaTest
//
//  Created by M on 13.10.14.
//  Copyright (c) 2014 M. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _worldMapView.mapType = MKMapTypeHybrid;
    _worldMapView.rotateEnabled = NO;
    
    _worldMapView.delegate = self;
    
    [self p_showRegionCoord2DAndDeltasInLabels];
}

#pragma mark - MKMapViewDelegateMethods

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
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
    CLLocationDegrees newLatitude = _worldMapView.region.center.latitude + _worldMapView.region.span.latitudeDelta / 2;
    if (newLatitude > 90) {
        newLatitude = 90;
    }
    
    CLLocationDegrees newLongitude = _worldMapView.region.center.longitude + _worldMapView.region.span.longitudeDelta / 2;
    if (newLongitude > 180) {
        newLongitude = 180;
    }
    
    _worldMapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(newLatitude, newLongitude), _worldMapView.region.span);
}

@end
