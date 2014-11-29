//
//  ViewController.m
//  seriouslyTest
//
//  Created by Markus Jufer on 14.10.13.
//  Copyright (c) 2013 Markus Jufer. All rights reserved.
//

#import "ViewController.h"
#import "Annotation.h"


@implementation ViewController

@synthesize topLayer = _topLayer;
@synthesize layerPostition = _layerPostition;
@synthesize myMapView = _myMapView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.layerPostition = self.topLayer.frame.origin.x;
    
    MKCoordinateSpan span;
	span.latitudeDelta= 0.5;
	span.longitudeDelta= 0.5;
    
	MKCoordinateRegion region;
	region.span=span;
	region.center=CLLocationCoordinate2DMake(47.2700443, 8.7494493);
    
    [_myMapView setRegion:region animated:YES];
	[_myMapView regionThatFits:region];
    
    //--------------------------------------------------------------------------
    //  -------  Annotation Pin  ------------
    //--------------------------------------------------------------------------
    
    CLLocationCoordinate2D annotationCoord;
    annotationCoord.latitude = 47.1934908;
    annotationCoord.longitude =  8.851700100000016;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"Marina Gastro AG";
    annotationPoint.subtitle = @"Hafenstrasse 4, 8853 Lachen";
    [_myMapView addAnnotation:annotationPoint];
    
    CLLocationCoordinate2D annotation;
    annotation.latitude = 47.1947937;
    annotation.longitude =   8.821458099999973;
    
    MKPointAnnotation *anno = [[MKPointAnnotation alloc] init];
    anno.coordinate = annotation;
    anno.title = @"Hensa Werft";
    anno.subtitle = @"Seestrasse 36, 8852 Altendorf";
    [_myMapView addAnnotation:anno];
    

}

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay{
	if([overlay isKindOfClass:[MKPolygon class]]){
		MKPolygonView *view = [[MKPolygonView alloc] initWithOverlay:overlay];
		view.lineWidth=1;
		view.strokeColor=[UIColor blueColor];
		view.fillColor=[[UIColor blueColor] colorWithAlphaComponent:0.5];
		
	}
	return nil;
}

//------------------------------------------------------------------------
//---- Slide Menu --------
//------------------------------------------------------------------------

#define VIEW_HIDDEN 260

- (void) animateLayerToPoint:(CGFloat)x{
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect frame = self.topLayer.frame;
                         frame.origin.x = x;
                         self.topLayer.frame = frame;
                     }
                     completion:^(BOOL finished){
                         self.layerPostition = self.topLayer.frame.origin.x;
                         
                     }];

}
- (IBAction)toggleLayer:(id)sender
{
    if (self.layerPostition == VIEW_HIDDEN) {
        [self animateLayerToPoint:0];
    } else {
        [self animateLayerToPoint:VIEW_HIDDEN];
    }
}

- (IBAction)panLayer:(UIPanGestureRecognizer *)pan
{
    
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan translationInView:self.topLayer];
        CGRect frame = self.topLayer.frame;
        frame.origin.x = self.layerPostition + point.x;
        
        if (frame.origin.x < 0) {
            frame.origin.x = 0;
        }
        self.topLayer.frame = frame;
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.topLayer.frame.origin.x <= 160) {
            [self animateLayerToPoint:0];
            
        } else {
            [self animateLayerToPoint: VIEW_HIDDEN];
        }
    }
}




@end