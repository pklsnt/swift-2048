//
//  ReactNativeModalBridge.m
//  swift-2048
//
//  Created by PATRICK LESAINT on 12/12/2020.
//  Copyright © 2020 Austin Zheng. All rights reserved.
//

#import "ReactNativeModalBridge.h"
#import "ReactNativeEvents.h"

@implementation ReactNativeModalBridge
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(closeModal) {
    [[NSNotificationCenter defaultCenter] postNotificationName:ReactEventCloseModal object:nil];
}

@end
