//
//  main1.m
//  StuPro
//
//  Created by 李华 on 15/4/11.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.m"

NSString  *colorName(color c){
    switch (c) {
        case red:
            return @"red";
            break;
        case yellow:
            return @"yellow";
        case blue:
            return @"blue";
        default:
            break;
    }
}


void drawCircle(ShapeRect sr,color color){
    NSLog(@"drawing a circle at (%d,%d,%d,%d) in %@",sr.x,sr.y,sr.width,sr.height,colorName(color));
}

void drawShapes(id shapes,int count){
    for(int i=0;i<count;i++){
        drawCircle((Circle)shapes[i].shapeRect, (Circle)shapes[i].c);
    }
}


int main (int argc,const char * argv[]){
    id shapes[1];
    shapes[0]=[Circle new];
    ShapeRect ret0={0,0,10,0};
    [shapes[0] setColor:red];
    [shapes[0] setShapeRect:(ret0)];
    drawShapes(shapes, 1);
    
}