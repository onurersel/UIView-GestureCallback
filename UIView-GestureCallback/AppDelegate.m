//
//  AppDelegate.m
//  UIView-GestureCallback
//
//  Created by Onur Ersel on 23/07/15.
//  Copyright (c) 2015 Onur Ersel. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+GestureCallback.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


/*----------------------------------
 *
 *  Since UIView+GestureCallback doesn't contain any logic, I'm testing it in this delegate class, directly on UI.
 *  You can check README.md for more (clear) info on usage, which is pretty straightforward and simple by the way :)
 *
 ---------------------------------*/


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self test];
    
    
    
    return YES;
}

-(void)test
{
    // Setting up window for testing on it's root controllers view
    
    self.window = [UIWindow new];
    CGRect rect = [UIScreen mainScreen].bounds;
    self.window.frame = rect;
    UIViewController *viewController = [UIViewController new];
    viewController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    // Create control buttons
    
    UIButton *buttonTap = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonTap setTitle:@"Tap Gesture" forState:UIControlStateNormal];
    [buttonTap addTarget:self action:@selector(tapHandler:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:buttonTap];
    
    UIButton *buttonPinch = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonPinch setTitle:@"Pinch Gesture" forState:UIControlStateNormal];
    [buttonPinch addTarget:self action:@selector(pinchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:buttonPinch];
    
    UIButton *buttonPan = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonPan setTitle:@"Pan Gesture" forState:UIControlStateNormal];
    [buttonPan addTarget:self action:@selector(panHandler:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:buttonPan];
    
    UIButton *buttonSwipe = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonSwipe setTitle:@"Swipe Gesture" forState:UIControlStateNormal];
    [buttonSwipe addTarget:self action:@selector(swipeHandler:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:buttonSwipe];
    
    UIButton *buttonRotation = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonRotation setTitle:@"Rotation Gesture" forState:UIControlStateNormal];
    [buttonRotation addTarget:self action:@selector(rotationHandler:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:buttonRotation];
    
    UIButton *buttonLongPress = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonLongPress setTitle:@"Long Press Gesture" forState:UIControlStateNormal];
    [buttonLongPress addTarget:self action:@selector(longPressHandler:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:buttonLongPress];
    
    buttonRotation.enabled = false;     //not implemented yet
    buttonLongPress.enabled = false;    //not implemented yet
    
    
    // Position control buttons
    
    float halfWidth = rect.size.width/2.0;
    const float bh = 35.0;
    buttonRotation.frame = CGRectMake(0, rect.size.height-bh, halfWidth, bh);
    buttonLongPress.frame = CGRectMake(halfWidth, rect.size.height-bh, halfWidth, bh);
    buttonPan.frame = CGRectMake(0, rect.size.height-bh*2, halfWidth, bh);
    buttonSwipe.frame = CGRectMake(halfWidth, rect.size.height-bh*2, halfWidth, bh);
    buttonTap.frame = CGRectMake(0, rect.size.height-bh*3, halfWidth, bh);
    buttonPinch.frame = CGRectMake(halfWidth, rect.size.height-bh*3, halfWidth, bh);
    
    
    
    // Info label
    infoLabel = [UILabel new];
    infoLabel.frame = rect;
    infoLabel.userInteractionEnabled = false;
    infoLabel.text = @"----";
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.alpha = .4;
    [viewController.view addSubview:infoLabel];
}



/*----------------------------------
 *
 *  Button handlers
 *
 ---------------------------------*/

NSString *s;
-(void)tapHandler:(UIButton*)sender
{
    if(! [sender isSelected]) {
        sender.selected = true;
        
        __block AppDelegate *_self = self;
        [self.window.rootViewController.view addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Tap"];
        }];
        
        [self.window.rootViewController.view addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Double Tap"];
        } numberOfTapsRequired:2 numberOfTouchesRequired:1];
        
        
    } else {
        sender.selected = false;
        
        [self.window.rootViewController.view removeAllTapGestures];
    }
}

-(void)pinchHandler:(UIButton*)sender
{
    if(! [sender isSelected]) {
        sender.selected = true;
        
        __block AppDelegate *_self = self;
        [self.window.rootViewController.view addPinchGestureRecognizer:^(UIPinchGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Pinch"];
        }];
        
    } else {
        sender.selected = false;
        
        [self.window.rootViewController.view removeAllPinchGestures];
    }
}

-(void)panHandler:(UIButton*)sender
{
    if(! [sender isSelected]) {
        sender.selected = true;
        
        __block AppDelegate *_self = self;
        [self.window.rootViewController.view addPanGestureRecognizer:^(UIPanGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Pan Double"];
        } minimumNumberOfTouches:2 maximumNumberOfTouches:NSUIntegerMax];
        [self.window.rootViewController.view addPanGestureRecognizer:^(UIPanGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Pan"];
        } minimumNumberOfTouches:1 maximumNumberOfTouches:1];
        
    } else {
        sender.selected = false;
        
        [self.window.rootViewController.view removeAllPanGestures];
    }
}

-(void)swipeHandler:(UIButton*)sender
{
    if(! [sender isSelected]) {
        sender.selected = true;
        
        __block AppDelegate *_self = self;
        [self.window.rootViewController.view addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Swipe Left"];
        } direction:UISwipeGestureRecognizerDirectionLeft];
        [self.window.rootViewController.view addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Swipe Right"];
        } direction:UISwipeGestureRecognizerDirectionRight];
        [self.window.rootViewController.view addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Swipe Up or Down"];
        } direction:UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionUp];
        [self.window.rootViewController.view addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Swipe Up or Down / Double"];
        } direction:UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionUp numberOfTouchesRequired:2];
        [self.window.rootViewController.view addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
            [_self updateText:@"Swipe Right or Left / Double"];
        } direction:UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft numberOfTouchesRequired:2];
        
    } else {
        sender.selected = false;
        
        [self.window.rootViewController.view removeAllSwipeGestures];
    }
}

-(void)rotationHandler:(UIButton*)sender
{
}

-(void)longPressHandler:(UIButton*)sender
{
}


/*----------------------------------
 *
 *  Update info text with last gesture
 *
 ---------------------------------*/

-(void)updateText:(NSString*)text
{
    infoLabel.text = text;
    infoLabel.alpha = 1;
    
    if (timer != nil) {
        [timer invalidate];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(hideText) userInfo:nil repeats:false];
}

-(void)hideText
{
    timer = nil;
    infoLabel.alpha = .3;
}

@end
