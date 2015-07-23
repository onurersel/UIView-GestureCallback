//
//  UIView+GestureCallback.h
//
//  Created by Onur Ersel on 01/07/15.
//  Copyright (c) 2015 Onur Ersel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GestureCallback)

@property (nonatomic)     void (^tapCallback)(UITapGestureRecognizer* recognizer);
@property (nonatomic)     UITapGestureRecognizer *tapGesture;

@property (nonatomic)     void (^pinchCallback)(UIPinchGestureRecognizer* recognizer);
@property (nonatomic)     UIPinchGestureRecognizer *pinchGesture;

@property (nonatomic)     void (^panCallback)(UIPanGestureRecognizer* recognizer);
@property (nonatomic)     UIPanGestureRecognizer *panGesture;

@property (nonatomic)     void (^swipeCallback)(UISwipeGestureRecognizer* recognizer);
@property (nonatomic)     UISwipeGestureRecognizer *swipeGesture;


-(void)addTapGestureRecognizer:(void(^)(UITapGestureRecognizer* recognizer))tapCallback;
-(void)addTapGestureRecognizer:(void (^)(UITapGestureRecognizer * recognizer))tapCallback  numberOfTapsRequired:(NSUInteger)numberOfTapsRequired  numberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired;
-(void)removeTapGestureRecognizer;

-(void)addPinchGestureRecognizer:(void(^)(UIPinchGestureRecognizer* recognizer))pinchCallback;
-(void)removePinchGestureRecognizer;

-(void)addPanGestureRecognizer:(void(^)(UIPanGestureRecognizer* recognizer))panCallback;
-(void)addPanGestureRecognizer:(void(^)(UIPanGestureRecognizer* recognizer))panCallback  maximumNumberOfTouches:(NSUInteger)maximumNumberOfTouches  minimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches;
-(void)removePanGestureRecognizer;

-(void)addSwipeGestureRecognizer:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback;
-(void)addSwipeGestureRecognizerUpDown:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback;
-(void)addSwipeGestureRecognizerLeftRight:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback;
-(void)addSwipeGestureRecognizer:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback  numberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired  direction:(UISwipeGestureRecognizerDirection)direction;
-(void)removeSwipeGestureRecognizer;

@end
