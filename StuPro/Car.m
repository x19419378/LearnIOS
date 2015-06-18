//
//  Car.m
//  StuPro
//
//  Created by 李华 on 15/4/29.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import "Car.h"
#import "Tire.h"
#import "Engine.h"

@implementation Car
- (void)setEngine:(Engine*)newEngine
{
    engine = newEngine;
}
- (Engine*)engine
{
    return engine;
}
- (void)setTire:(Tire*)tire atIndex:(int)index
{
    tires[index] = tire;
}
- (Tire*)tireAtIndex:(int)index
{
    return tires[index];
}
- (void)print
{
    NSLog(@"%@", engine);
    NSLog(@"%@", tires[0]);
    NSLog(@"%@", tires[1]);
    NSLog(@"%@", tires[2]);
    NSLog(@"%@", tires[3]);
}

@end

int main(int argc, const char* argv[])
{
    Car* car = [Car new];
    Engine* engine = [Engine new];
    [car setEngine:engine];

    for (int i = 0; i < 4; i++) {
        Tire* tire = [Tire new];
        [car setTire:tire atIndex:i];
    }
    [car print];
    NSMutableString* string = [NSMutableString stringWithFormat:@"We are %d", 18];
    NSMutableString* string1 = [NSMutableString stringWithCapacity:10];
    [string1 appendString:@"we are"];
    [string1 appendFormat:@" %d", 18];
    NSLog(@"%@,%@", string, string1);
    NSLog(@"%ld", [string compare:string1 options:NSCaseInsensitiveSearch | NSNumericSearch]);
    NSLog(@"%ld", [string rangeOfString:@"18"].location);
    [string deleteCharactersInRange:[string rangeOfString:@"are"]];
    NSLog(@"%@", string);

    NSMutableArray* arr = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray* arr1 = [[NSMutableArray alloc] initWithObjects:@"one", @"two", @"three", nil];
    for (NSInteger i = 0; i < 4; i++) {
        [arr addObject:[Tire new]];
    }
    NSEnumerator* enumerator = [arr objectEnumerator];
    id ii = nil;
    while (ii = [enumerator nextObject]) {
        NSLog(@"%@", ii);
    }
    for (id ii in arr1) {
        NSLog(@"%@", ii);
    }
    [arr1 enumerateObjectsUsingBlock:^(id i, NSUInteger integer, BOOL* stop) {
        NSLog(@"%@,%ld,%s", i, integer, stop);
    }];

    //    NSString* str = @"http://v.weipai.cn/video/201403/07/05/689E0E15-035A-455E-908C-02B7B7D6404B.mov http://v.weipai.cn/video/201403/07/00/7BDEEE4B-C849-4FA6-AB59-93A579B6790F.mov http://v.weipai.cn/video/201403/07/08/509DEF27-238D-4254-9FD7-12F2555A807E.mov http://v.weipai.cn/video/201403/07/09/7A30A812-1C24-443B-B6F5-3478EEE83CD2.mov http://v.weipai.cn/video/201403/07/10/818095E0-A351-44E9-84C2-58C5323EF98B.mov";

    NSFileHandle* fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:@"/Users/lee/Desktop/1.txt"];
    NSData* data = [fileHandle readDataToEndOfFile];
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString* pattern = @"http://v.weipai(.*?).mov";
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSArray* array = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    NSUInteger lastInx = 0;
    int i = 1;
    for (NSTextCheckingResult* match in array) {
        NSRange range = match.range;
        if (range.location >= lastInx) {
            NSString* temp = [str substringWithRange:NSMakeRange(lastInx, range.location + range.length - lastInx)];
            temp = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSURL* url = [NSURL URLWithString:temp];
            NSURLRequest* request = [NSURLRequest requestWithURL:url];
            NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            if (data != nil) {
                NSString* filename = [NSString stringWithFormat:@"/Users/lee/Documents/moive/%d.mov", i];
                if ([data writeToFile:filename atomically:YES]) {
                    i++;
                    NSLog(@"%@", temp);
                    [fileHandle closeFile];
                }
            }
        }
        lastInx = range.location + range.length;
    }
}