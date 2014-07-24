//
//  ViewController.m
//  MAPlay
//
//  Created by Alessandro Camillo Gimenez de Menezes on 22/07/14.
//  Copyright (c) 2014 Alessandro Camillo Gimenez de Menezes. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    // Do any additional setup after loading the view, typically from a nib.
    //4
    self.mapView.delegate = self;
    //5
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 40.740384;
    coordinate1.longitude = -73.991146;
    //MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY"];
    MyAnnotation *annotation = [[MyAnnotation alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY" subtitle:@"1"];
    [self.mapView addAnnotation:annotation];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 40.741623;
    coordinate2.longitude = -73.992021;
    MyAnnotation *annotation2 = [[MyAnnotation alloc] initWithCoordinate:coordinate2 title:@"Pascal Boyer Gallery" subtitle:@"2"];
    [self.mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 40.739490;
    coordinate3.longitude = -73.991154;
    MyAnnotation *annotation3 = [[MyAnnotation alloc] initWithCoordinate:coordinate3 title:@"Virgin Records" subtitle:@"3"];
    [self.mapView addAnnotation:annotation3];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.740848;
    zoomLocation.longitude= -73.991145;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
   [self.mapView setRegion:viewRegion animated:YES];
    
}


//6
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    if([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    //7
    static NSString *identifier = @"myAnnotation";
    MKAnnotationView * annotationView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView){
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        //10
        
        //aki que muda a imagem do pino dependendo do do tipo de ponto
        switch ([[[annotationView annotation] subtitle] integerValue]) {
            case 1:
                annotationView.image = [UIImage imageNamed:@"blue.png"];
                break;
            case 2:
                annotationView.image = [UIImage imageNamed:@"green.png"];
                break;
            case 3:
                annotationView.image = [UIImage imageNamed:@"red.png"];
                break;
            default:
                annotationView.image = [UIImage imageNamed:@"pin.png"];
                break;
        }

    }else {
        annotationView.annotation = annotation;
    }
    return annotationView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
