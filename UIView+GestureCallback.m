
//  UIView+GestureCallback.h
//
//  Created by Onur Ersel on 01/07/15.
//  Copyright (c) 2015 Onur Ersel. All rights reserved.
//

#import "UIView+GestureCallback.h"
#import <objc/runtime.h>

const NSString *UIView_GestureCallback_tapGestureKey = @"UIView_GestureCallback_tapGestureKey";
const NSString *UIView_GestureCallback_tapCallbackKey = @"UIView_GestureCallback_tapCallbackKey";
const NSString *UIView_GestureCallback_pinchGestureKey = @"UIView_GestureCallback_pinchGestureKey";
const NSString *UIView_GestureCallback_pinchCallbackKey = @"UIView_GestureCallback_pinchCallbackKey";
const NSString *UIView_GestureCallback_panGestureKey = @"UIView_GestureCallback_panGestureKey";
const NSString *UIView_GestureCallback_panCallbackKey = @"UIView_GestureCallback_panCallbackKey";
const NSString *UIView_GestureCallback_swipeGestureKey = @"UIView_GestureCallback_swipeGestureKey";
const NSString *UIView_GestureCallback_swipeCallbackKey = @"UIView_GestureCallback_swipeCallbackKey";

@implementation UIView (GestureCallback)
@dynamic tapCallback, tapGesture;
@dynamic pinchCallback, pinchGesture;
@dynamic panCallback, panGesture;
@dynamic swipeCallback, swipeGesture;


#pragma mark - ##### TAP


#pragma mark wrappers
-(void)addTapGestureRecognizer:(void(^)(UITapGestureRecognizer* recognizer))tapCallback
{
    [self addTapGestureRecognizer:tapCallback numberOfTapsRequired:1 numberOfTouchesRequired:1];
}


-(void)addTapGestureRecognizer:(void (^)(UITapGestureRecognizer * recognizer))tapCallback  numberOfTapsRequired:(NSUInteger)numberOfTapsRequired  numberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
    self.tapCallback = tapCallback;
    
    [self removeTapGestureRecognizer];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    self.tapGesture.numberOfTapsRequired = numberOfTapsRequired;
    self.tapGesture.numberOfTouchesRequired = numberOfTouchesRequired;
    [self addGestureRecognizer:self.tapGesture];
}

-(void)removeTapGestureRecognizer
{
    if(self.tapGesture != nil) {
        [self removeGestureRecognizer:self.tapGesture];
    }
}

-(void)tapHandler:(UITapGestureRecognizer*)recognizer
{
    if(self.tapCallback != nil) {
        self.tapCallback(recognizer);
    }
}


#pragma mark getter/setters

-(UITapGestureRecognizer *)tapGesture {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_tapGestureKey);
}
-(void) setTapGesture:(UITapGestureRecognizer *)value
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_tapGestureKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void (^)(UITapGestureRecognizer* recognizer))tapCallback {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_tapCallbackKey);
}
-(void)setTapCallback:(void (^)(UITapGestureRecognizer* recognizer))tapCallbackValue
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_tapCallbackKey, tapCallbackValue, OBJC_ASSOCIATION_COPY);
}






#pragma mark - ##### PINCH


#pragma mark wrappers
-(void)addPinchGestureRecognizer:(void(^)(UIPinchGestureRecognizer* recognizer))pinchCallback
{
    self.pinchCallback = pinchCallback;
    
    [self removePinchGestureRecognizer];
    self.pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHandler:)];
    [self addGestureRecognizer:self.pinchGesture];
}

-(void)removePinchGestureRecognizer
{
    if(self.pinchGesture != nil) {
        [self removeGestureRecognizer:self.pinchGesture];
    }
}

-(void)pinchHandler:(UIPinchGestureRecognizer*)recognizer
{
    if(self.pinchCallback != nil) {
        self.pinchCallback(recognizer);
    }
}


#pragma mark getter/setters

-(UIPinchGestureRecognizer *)pinchGesture {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_pinchGestureKey);
}
-(void) setPinchGesture:(UIPinchGestureRecognizer *)value
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_pinchGestureKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void (^)(UIPinchGestureRecognizer* recognizer))pinchCallback {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_pinchCallbackKey);
}
-(void)setPinchCallback:(void (^)(UIPinchGestureRecognizer* recognizer))pinchCallbackValue
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_pinchCallbackKey, pinchCallbackValue, OBJC_ASSOCIATION_COPY);
}






#pragma mark - ##### PAN


#pragma mark wrappers
-(void)addPanGestureRecognizer:(void(^)(UIPanGestureRecognizer* recognizer))panCallback
{
    [self addPanGestureRecognizer:panCallback maximumNumberOfTouches:NSUIntegerMax minimumNumberOfTouches:1];
}


-(void)addPanGestureRecognizer:(void(^)(UIPanGestureRecognizer* recognizer))panCallback  maximumNumberOfTouches:(NSUInteger)maximumNumberOfTouches  minimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches
{
    self.panCallback = panCallback;
    
    [self removePanGestureRecognizer];
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    self.panGesture.minimumNumberOfTouches = minimumNumberOfTouches;
    self.panGesture.maximumNumberOfTouches = maximumNumberOfTouches;
    [self addGestureRecognizer:self.panGesture];
}

-(void)removePanGestureRecognizer
{
    if(self.panGesture != nil) {
        [self removeGestureRecognizer:self.panGesture];
    }
}

-(void)panHandler:(UIPanGestureRecognizer*)recognizer
{
    if(self.panCallback != nil) {
        self.panCallback(recognizer);
    }
}


#pragma mark getter/setters

-(UIPanGestureRecognizer *)panGesture {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_panGestureKey);
}
-(void) setPanGesture:(UIPanGestureRecognizer *)value
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_panGestureKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void (^)(UIPanGestureRecognizer* recognizer))panCallback {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_panCallbackKey);
}
-(void)setPanCallback:(void (^)(UIPanGestureRecognizer* recognizer))panCallbackValue
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_panCallbackKey, panCallbackValue, OBJC_ASSOCIATION_COPY);
}






#pragma mark - ##### SWIPE


#pragma mark wrappers
-(void)addSwipeGestureRecognizer:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback
{
    [self addSwipeGestureRecognizer:swipeCallback numberOfTouchesRequired:1 direction:UISwipeGestureRecognizerDirectionRight];
}

-(void)addSwipeGestureRecognizerUpDown:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback
{
    [self addSwipeGestureRecognizer:swipeCallback
            numberOfTouchesRequired:1
                          direction:UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown];
}
-(void)addSwipeGestureRecognizerLeftRight:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback
{
    [self addSwipeGestureRecognizer:swipeCallback
            numberOfTouchesRequired:1
                          direction:UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight];
}


-(void)addSwipeGestureRecognizer:(void(^)(UISwipeGestureRecognizer* recognizer))swipeCallback  numberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired  direction:(UISwipeGestureRecognizerDirection)direction
{
    self.swipeCallback = swipeCallback;
    
    [self removeSwipeGestureRecognizer];
    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    self.swipeGesture.numberOfTouchesRequired = numberOfTouchesRequired;
    self.swipeGesture.direction = direction;
    [self addGestureRecognizer:self.swipeGesture];
}

-(void)removeSwipeGestureRecognizer
{
    if(self.swipeGesture != nil) {
        [self removeGestureRecognizer:self.swipeGesture];
    }
}

-(void)swipeHandler:(UISwipeGestureRecognizer*)recognizer
{
    if(self.swipeCallback != nil) {
        self.swipeCallback(recognizer);
    }
}


#pragma mark getter/setters

-(UISwipeGestureRecognizer *)swipeGesture {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_swipeGestureKey);
}
-(void) setSwipeGesture:(UISwipeGestureRecognizer *)value
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_swipeGestureKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void (^)(UISwipeGestureRecognizer* recognizer))swipeCallback {
    return objc_getAssociatedObject(self, &UIView_GestureCallback_swipeCallbackKey);
}
-(void)setSwipeCallback:(void (^)(UISwipeGestureRecognizer* recognizer))swipeCallbackValue
{
    objc_setAssociatedObject(self, &UIView_GestureCallback_swipeCallbackKey, swipeCallbackValue, OBJC_ASSOCIATION_COPY);
}



//TODO : UIRotationGestureRecognizer
//TODO : UILongPressGestureRecognizer
//TODO : CustomGestureRecognizer




#pragma mark - cleanup


-(void)dealloc
{
    [self removeTapGestureRecognizer];
    [self removePinchGestureRecognizer];
}







@end
