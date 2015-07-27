//
//  UIView_GestureCallback_Tests.m
//  UIView-GestureCallback Tests
//
//  Created by Onur Ersel on 27/07/15.
//  Copyright (c) 2015 Onur Ersel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIView+GestureCallback.h"

@interface UIView_GestureCallback_Tests : XCTestCase
{
    UIView *testView;
}

@end

@implementation UIView_GestureCallback_Tests

- (void)setUp {
    [super setUp];
    testView = [UIView new];
}

- (void)tearDown {
    
    [testView removeAllLongPressGestures];
    [testView removeAllPanGestures];
    [testView removeAllPinchGestures];
    [testView removeAllRotationGestures];
    [testView removeAllSwipeGestures];
    [testView removeAllTapGestures];
    testView = nil;
    
    [super tearDown];
}

#pragma mark - basics


-(void)testIdAccess
{
    NSString *gestureId1 = [testView addTapGestureRecognizer:nil];
    XCTAssertNotNil(gestureId1);
}

-(void)testTapGestureObject
{
    NSString *gestureId1 = [testView addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
    }];
    GestureCallbackValues *v = [testView.gestures objectForKey:gestureId1];
    
    XCTAssertNotNil(v);
    XCTAssertNotNil(v.gesture);
    XCTAssertNotNil(v.gestureId);
    XCTAssertEqual(gestureId1, v.gestureId);
    XCTAssertNotNil(v.tapCallback);
    XCTAssertNil(v.panCallback);
    XCTAssertNil(v.pinchCallback);
    XCTAssertNil(v.rotationCallback);
    XCTAssertNil(v.swipeCallback);
    XCTAssertNil(v.longPressCallback);
}
-(void)testPanGestureObject
{
    NSString *gestureId1 = [testView addPanGestureRecognizer:^(UIPanGestureRecognizer *recognizer, NSString *gestureId) {
    }];
    GestureCallbackValues *v = [testView.gestures objectForKey:gestureId1];
    
    XCTAssertNotNil(v);
    XCTAssertNotNil(v.gesture);
    XCTAssertNotNil(v.gestureId);
    XCTAssertEqual(gestureId1, v.gestureId);
    XCTAssertNotNil(v.panCallback);
    XCTAssertNil(v.tapCallback);
    XCTAssertNil(v.pinchCallback);
    XCTAssertNil(v.rotationCallback);
    XCTAssertNil(v.swipeCallback);
    XCTAssertNil(v.longPressCallback);
}
-(void)testPinchGestureObject
{
    NSString *gestureId1 = [testView addPinchGestureRecognizer:^(UIPinchGestureRecognizer *recognizer, NSString *gestureId) {
    }];
    GestureCallbackValues *v = [testView.gestures objectForKey:gestureId1];
    
    XCTAssertNotNil(v);
    XCTAssertNotNil(v.gesture);
    XCTAssertNotNil(v.gestureId);
    XCTAssertEqual(gestureId1, v.gestureId);
    XCTAssertNotNil(v.pinchCallback);
    XCTAssertNil(v.panCallback);
    XCTAssertNil(v.tapCallback);
    XCTAssertNil(v.rotationCallback);
    XCTAssertNil(v.swipeCallback);
    XCTAssertNil(v.longPressCallback);
}
-(void)testRotateGestureObject
{
    NSString *gestureId1 = [testView addRotationGestureRecognizer:^(UIRotationGestureRecognizer *recognizer, NSString *gestureId) {
    }];
    GestureCallbackValues *v = [testView.gestures objectForKey:gestureId1];
    
    XCTAssertNotNil(v);
    XCTAssertNotNil(v.gesture);
    XCTAssertNotNil(v.gestureId);
    XCTAssertEqual(gestureId1, v.gestureId);
    XCTAssertNotNil(v.rotationCallback);
    XCTAssertNil(v.panCallback);
    XCTAssertNil(v.pinchCallback);
    XCTAssertNil(v.tapCallback);
    XCTAssertNil(v.swipeCallback);
    XCTAssertNil(v.longPressCallback);
}
-(void)testSwipeGestureObject
{
    NSString *gestureId1 = [testView addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
    } direction:UISwipeGestureRecognizerDirectionDown];
    GestureCallbackValues *v = [testView.gestures objectForKey:gestureId1];
    
    XCTAssertNotNil(v);
    XCTAssertNotNil(v.gesture);
    XCTAssertNotNil(v.gestureId);
    XCTAssertEqual(gestureId1, v.gestureId);
    XCTAssertNotNil(v.swipeCallback);
    XCTAssertNil(v.panCallback);
    XCTAssertNil(v.pinchCallback);
    XCTAssertNil(v.rotationCallback);
    XCTAssertNil(v.tapCallback);
    XCTAssertNil(v.longPressCallback);
}
-(void)testLongPressGestureObject
{
    NSString *gestureId1 = [testView addLongPressGestureRecognizer:^(UILongPressGestureRecognizer *recognizer, NSString *gestureId) {
    }];
    GestureCallbackValues *v = [testView.gestures objectForKey:gestureId1];
    
    XCTAssertNotNil(v);
    XCTAssertNotNil(v.gesture);
    XCTAssertNotNil(v.gestureId);
    XCTAssertEqual(gestureId1, v.gestureId);
    XCTAssertNotNil(v.longPressCallback);
    XCTAssertNil(v.panCallback);
    XCTAssertNil(v.pinchCallback);
    XCTAssertNil(v.rotationCallback);
    XCTAssertNil(v.swipeCallback);
    XCTAssertNil(v.tapCallback);
}


#pragma mark - callback

-(void)testCallback
{
    
    __block BOOL success = false;
    
    NSString *gestureId1 = [testView addTapGestureRecognizer:nil];
    NSString *gestureId2 = [testView addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
        success = true;
    }];
    GestureCallbackValues *v1 = [testView.gestures objectForKey:gestureId1];
    GestureCallbackValues *v2 = [testView.gestures objectForKey:gestureId2];
    
    [testView tapHandler:(UITapGestureRecognizer*)v1.gesture];
    [testView tapHandler:(UITapGestureRecognizer*)v2.gesture];
    
    XCTAssertTrue(success);
}

#pragma mark - add remove

-(void)testAddGestureWithSameId
{
    XCTAssertEqual(testView.gestures.count, 0);
    [testView addTapGestureRecognizer:nil tapGestureId:@"id1"];
    XCTAssertEqual(testView.gestures.count, 1);
    [testView addRotationGestureRecognizer:nil rotationGestureId:@"id1"];
    XCTAssertEqual(testView.gestures.count, 1);
    
    GestureCallbackValues *v = [testView.gestures objectForKey:@"id1"];
    XCTAssertTrue([v.gesture isKindOfClass:[UIRotationGestureRecognizer class]]);
}

-(void)testStoringAndRemovingGestures
{
    XCTAssertEqual(testView.gestures.count, 0);
    NSString *gestureId1 = [testView addTapGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 1);
    NSString *gestureId2 = [testView addPinchGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 2);
    NSString *gestureId3 = [testView addPanGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 3);
    NSString *gestureId4 = [testView addSwipeGestureRecognizer:nil direction:UISwipeGestureRecognizerDirectionDown];
    XCTAssertEqual(testView.gestures.count, 4);
    NSString *gestureId5 = [testView addRotationGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 5);
    NSString *gestureId6 = [testView addLongPressGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 6);
    
    [testView removeTapGesture:gestureId1];
    XCTAssertEqual(testView.gestures.count, 5);
    [testView removeTapGesture:gestureId2];
    XCTAssertEqual(testView.gestures.count, 4);
    [testView removeTapGesture:gestureId3];
    XCTAssertEqual(testView.gestures.count, 3);
    [testView removeTapGesture:gestureId4];
    XCTAssertEqual(testView.gestures.count, 2);
    [testView removeTapGesture:gestureId5];
    XCTAssertEqual(testView.gestures.count, 1);
    [testView removeTapGesture:gestureId6];
    XCTAssertEqual(testView.gestures.count, 0);
}

-(void)testStoringAndRemovingMultipleGestures
{
    XCTAssertEqual(testView.gestures.count, 0);
    NSString *gestureId1 = [testView addTapGestureRecognizer:nil];
    NSString *gestureId2 = [testView addTapGestureRecognizer:nil];
    NSString *gestureId3 = [testView addTapGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 3);
    NSString *gestureId4 = [testView addPinchGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 4);
    
    [testView removeTapGesture:gestureId1];
    XCTAssertEqual(testView.gestures.count, 3);
    [testView removeTapGesture:gestureId2];
    XCTAssertEqual(testView.gestures.count, 2);
    [testView removeTapGesture:gestureId3];
    XCTAssertEqual(testView.gestures.count, 1);
    [testView removeTapGesture:gestureId4];
    XCTAssertEqual(testView.gestures.count, 0);
}

-(void)testRemovingWrongTypeOfGesture
{
    XCTAssertEqual(testView.gestures.count, 0);
    NSString *gestureId1 = [testView addTapGestureRecognizer:nil];
    XCTAssertEqual(testView.gestures.count, 1);
    
    [testView removeTapGesture:@"some_other_id_longer_than_12_character"];
    XCTAssertEqual(testView.gestures.count, 1);
    [testView removeTapGesture:gestureId1];
    XCTAssertEqual(testView.gestures.count, 0);
}


-(void)testRemoveAll
{
    [testView addTapGestureRecognizer:nil];
    
    [testView addPinchGestureRecognizer:nil];
    [testView addPinchGestureRecognizer:nil];
    
    [testView addPanGestureRecognizer:nil];
    [testView addPanGestureRecognizer:nil];
    [testView addPanGestureRecognizer:nil];
    
    [testView addSwipeGestureRecognizer:nil direction:UISwipeGestureRecognizerDirectionDown];
    [testView addSwipeGestureRecognizer:nil direction:UISwipeGestureRecognizerDirectionDown];
    [testView addSwipeGestureRecognizer:nil direction:UISwipeGestureRecognizerDirectionDown];
    [testView addSwipeGestureRecognizer:nil direction:UISwipeGestureRecognizerDirectionDown];
    
    [testView addRotationGestureRecognizer:nil];
    [testView addRotationGestureRecognizer:nil];
    [testView addRotationGestureRecognizer:nil];
    [testView addRotationGestureRecognizer:nil];
    [testView addRotationGestureRecognizer:nil];
    
    [testView addLongPressGestureRecognizer:nil];
    [testView addLongPressGestureRecognizer:nil];
    [testView addLongPressGestureRecognizer:nil];
    [testView addLongPressGestureRecognizer:nil];
    [testView addLongPressGestureRecognizer:nil];
    [testView addLongPressGestureRecognizer:nil];
    
    XCTAssertEqual(testView.gestures.count, 21);
    
    [testView removeAllTapGestures];
    XCTAssertEqual(testView.gestures.count, 20);
    [testView removeAllPinchGestures];
    XCTAssertEqual(testView.gestures.count, 18);
    [testView removeAllPanGestures];
    XCTAssertEqual(testView.gestures.count, 15);
    [testView removeAllSwipeGestures];
    XCTAssertEqual(testView.gestures.count, 11);
    [testView removeAllRotationGestures];
    XCTAssertEqual(testView.gestures.count, 6);
    [testView removeAllLongPressGestures];
    XCTAssertEqual(testView.gestures.count, 0);
}


@end
