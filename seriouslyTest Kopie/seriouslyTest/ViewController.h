//
//  ViewController.h
//  seriouslyTest
//
//  Created by Markus Jufer on 14.10.13.
//  Copyright (c) 2013 Markus Jufer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *_myMapView;
    
}

@property (weak, nonatomic) IBOutlet UIView *topLayer;
@property (nonatomic) CGFloat layerPostition;
@property (nonatomic, retain) IBOutlet MKMapView *myMapView;


@end
