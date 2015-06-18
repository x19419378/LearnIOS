//
//  main.m
//  StuPro
//
//  Created by 李华 on 15/4/9.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL differents(int i ,int y){
    return i-y;
}

NSString *toString(BOOL boolValue){
    if(boolValue)
        return @"yes";
    else
        return @"no";
}

int main(int argc, const char * argv[]) {
    //NSLog(@" %d and %d are different? %@",5,5,toString(differents(5, 5)));
    if(argc==1)
        NSLog(@"need file ");
    
    FILE *wfile=fopen(argv[1], "r");
    char word[10];
    while (fgets(word, 10, wfile)) {
        word[strlen(word)-1]='0';
        NSLog(@"%s is %lu",word,strlen(word));
    }
    fclose(wfile);
    return 0;
}

