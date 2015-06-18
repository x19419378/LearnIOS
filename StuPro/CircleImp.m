//
//  CircleImp.m
//  StuPro
//
//  Created by 李华 on 15/4/13.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.m"

@implementation Circle
-(void) setColor:(color)c
{
    c=color;
}
-(void) setShapeRect:(ShapeRect)sr
{
    sr=shapeRect;
}
-(void) draw
{
    NSLog(@"drawing a circle at (%d,%d,%d,%d) in %@",shapeRect.x,shapeRect.y,shapeRect.width,shapeRect.height,colorName(color));
}
@end