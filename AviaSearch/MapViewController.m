//
//  MapViewController.m
//  AviaSearch
//
//  Created by Чернецова Юлия on 30/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import "MapViewController.h"
#import "LocationService.h"
#import "APIManager.h"
#import "MapPrice.h"
@interface MapViewController()<MKMapViewDelegate>
@property(strong,nonatomic) LocationService *locationService;
@property(strong,nonatomic) MKMapView *mapView;
@property(strong,nonatomic) City *city;
@property(strong,nonatomic) NSArray *prices;
@end

@implementation MapViewController
- (void) viewDidLoad {
    [super viewDidLoad];
    self.title = @"Карта цен";
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = TRUE;
    [self.view   addSubview:_mapView];
    [[DataManager sharedInstance] loadData];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(dataLoadedSuccessfully) name:kDataManagerLoadDataDidComplete object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiceDidUpdateCurrentLocation object:nil];
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void) dataLoadedSuccessfully{
    _locationService = [[LocationService alloc] init];
}

-(void) updateCurrentLocation: (NSNotification *)notification {
    CLLocation *currentLocation = notification.object;
    MKCoordinateRegion region =  MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 1000000, 1000000);
    [_mapView setRegion:region animated:TRUE];
    if (currentLocation){
        _city = [[DataManager sharedInstance] cityForLocation:currentLocation];
        if (_city){
            [[APIManager sharedInstance] mapPricesFor:_city withCompletion:^(NSArray *prices) {
                self.prices = prices;
            }];
        }
    }
}
- (void) setPrices: (NSArray *)prices{
    _prices = prices;
    [_mapView removeAnnotations: _mapView.annotations];
    for (MapPrice *price in prices) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = [NSString stringWithFormat:@"%@ (%@)",price.destination.name, price.destination.code];
            annotation.subtitle = [NSString stringWithFormat:@"%ld рубю",price.value];
            annotation.coordinate = price.destination.coordinate;
            [self->_mapView addAnnotation:annotation];
        });
    }
}
@end
