//
//  UIView+GestureCallback.h
//
//  Created by Onur Ersel on 01/07/15.
//  Copyright (c) 2015 Onur Ersel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GestureCallbackValues : NSObject

@property (nonatomic, copy)         void (^tapCallback)(UITapGestureRecognizer* recognizer, NSString* gestureId);
@property (nonatomic, copy)         void (^pinchCallback)(UIPinchGestureRecognizer* recognizer, NSString* gestureId);
@property (nonatomic, copy)         void (^panCallback)(UIPanGestureRecognizer* recognizer, NSString* gestureId);
@property (nonatomic, copy)         void (^swipeCallback)(UISwipeGestureRecognizer* recognizer, NSString* gestureId);

@property (nonatomic, retain)       UIGestureRecognizer *gesture;
@property (nonatomic, retain)       NSString *gestureId;

@end



@interface UIView (GestureCallback)

@property (nonatomic)     NSMutableDictionary *gestures;
@property (nonatomic)     NSMutableDictionary *gestureKeysHash;


// tap
-(NSString*)addTapGestureRecognizer:(void(^)(UITapGestureRecognizer* recognizer, NSString* gestureId))tapCallback;
-(NSString*)addTapGestureRecognizer:(void(^)(UITapGestureRecognizer* recognizer, NSString* gestureId))tapCallback  numberOfTapsRequired:(NSUInteger)numberOfTapsRequired  numberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired;
-(void)addTapGestureRecognizer:(void(^)(UITapGestureRecognizer* recognizer, NSString* gestureId))tapCallback  tapGestureId:(NSString*)tapGestureId;
-(void)addTapGestureRecognizer:(void(^)(UITapGestureRecognizer* recognizer, NSString* gestureId))tapCallback  tapGestureId:(NSString*)tapGestureId  numberOfTapsRequired:(NSUInteger)numberOfTapsRequired  numberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired;
-(void)removeTapGesture:(NSString*)tapGestureId;
-(void)removeAllTapGestures;


// pinch
-(NSString*)addPinchGestureRecognizer:(void(^)(UIPinchGestureRecognizer* recognizer, NSString* gestureId))pinchCallback;
-(void)addPinchGestureRecognizer:(void(^)(UIPinchGestureRecognizer* recognizer, NSString* gestureId))pinchCallback  pinchGestureId:(NSString*)pinchGestureId;
-(void)removePinchGesture:(NSString*)pinchGestureId;
-(void)removeAllPinchGestures;
-(void)pinchHandler:(UIPinchGestureRecognizer*)recognizer;


@end
