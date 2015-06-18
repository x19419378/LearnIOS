//
//  Car.h
//  StuPro
//
//  Created by 李华 on 15/4/29.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "Tire.h"
//#import "Engine.h"
@class Tire;
@class Engine;

@interface Car : NSObject {
    Tire* tires[4];
    Engine* engine;
}
- (Engine*)engine;
- (void)setEngine:(Engine*)newEngine;
- (void)setTire:(Tire*)tire atIndex:(int)index;
- (Tire*)tireAtIndex:(int)index;
- (void)print;
@end
