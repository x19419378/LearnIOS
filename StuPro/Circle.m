//
//  Circle.m
//  StuPro
//
//  Created by 李华 on 15/4/13.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    red,
    yellow,
    blue
}color;

typedef enum {
    kCircle,
    kRectangle,
    kOblateSpherold
}xz;

typedef struct{int x,y,width,height;} ShapeRect;
typedef struct{color c;xz z;ShapeRect shapeRect;} shape;

@interface Circle:NSObject
{
    color color;
    ShapeRect shapeRect;
}
-(void) setColor:(color) c;
-(void) setShapeRect:(ShapeRect) sr;
-(void) draw;
@end
